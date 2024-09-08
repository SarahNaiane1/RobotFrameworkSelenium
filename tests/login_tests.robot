*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${URL_SITE}                https://www.saucedemo.com/
${BROWSER}                 chrome
${USERNAME_ID}             id=user-name
${PASSWORD_ID}             id=password
${LOGIN_BTN_ID}            id=login-button
${ERROR_MESSAGE_CLASS}     error-message-container
${USERNAME_REQUIRED_MSG}   Epic sadface: Username is required
${PASSWORD_REQUIRED_MSG}   Epic sadface: Password is required
${URL_PRODUTOS}            https://www.saucedemo.com/inventory.html
${VALID_USERNAME}          standard_user
${VALID_PASSWORD}          secret_sauce
${INVALID_USERNAME}        standard_user1
${INVALID_PASSWORD}        secret_sauce1
${EMPTY_STRING}            ${EMPTY}

*** Keywords ***
Open Browser And Access Site
    Open Browser    ${URL_SITE}    ${BROWSER}
    Maximize Browser Window

Fill Login Form
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_ID}    ${username}
    Input Text    ${PASSWORD_ID}    ${password}
    Click Button    ${LOGIN_BTN_ID}

Go To Products Page
    Go To    ${URL_PRODUTOS}

Verify Error Message
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    css:.${ERROR_MESSAGE_CLASS}    timeout=10s
    Element Should Contain    css:.${ERROR_MESSAGE_CLASS} h3    ${expected_message}

*** Test Cases ***
Scenario: Successful Login to Swag Labs and Validation Page of Products
    [Documentation]    Verify that a user with valid credentials can log in successfully
    Open Browser And Access Site
    Fill Login Form    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Go To Products Page

Login with invalid credentials
    [Documentation]    Verify that an error message is shown when invalid credentials are used
    Open Browser And Access Site
    Fill Login Form    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Error Message    Epic sadface: Username and password do not match any user in this service

Leave login form fields empty
    [Documentation]    Verify that an error message is shown when both fields are left empty
    Open Browser And Access Site
    Fill Login Form    ${EMPTY_STRING}    ${EMPTY_STRING}
    Verify Error Message    ${USERNAME_REQUIRED_MSG}

Leave username field empty
    [Documentation]    Verify that an error message is shown when the username field is left empty
    Open Browser And Access Site
    Fill Login Form    ${EMPTY_STRING}    ${VALID_PASSWORD}
    Verify Error Message    ${USERNAME_REQUIRED_MSG}

Leave password field empty
    [Documentation]    Verify that an error message is shown when the password field is left empty
    Open Browser And Access Site
    Fill Login Form    ${VALID_USERNAME}    ${EMPTY_STRING}
    Verify Error Message    ${PASSWORD_REQUIRED_MSG}
