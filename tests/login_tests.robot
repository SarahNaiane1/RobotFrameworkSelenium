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

*** Keywords ***
Open Browser And Access Site
    Open Browser    ${URL_SITE}    ${BROWSER}
    Maximize Browser Window

Fill Login Form
    Input Text    ${USERNAME_ID}    standard_user
    Input Text    ${PASSWORD_ID}    secret_sauce
    Click Button  ${LOGIN_BTN_ID}

Go To Products Page
    Go To    ${URL_PRODUTOS}

Fill Login Invalid Form
    Input Text    ${USERNAME_ID}    standard_user1
    Input Text    ${PASSWORD_ID}    secret_sauce1
    Click Button    ${LOGIN_BTN_ID}

Login Form Fields Empty
    Input Text    ${USERNAME_ID}    ${EMPTY}
    Input Text    ${PASSWORD_ID}    ${EMPTY}
    Click Button    ${LOGIN_BTN_ID}
    Wait Until Element Is Visible    css:.${ERROR_MESSAGE_CLASS}    timeout=10s
    Element Should Contain    css:.${ERROR_MESSAGE_CLASS} h3    ${USERNAME_REQUIRED_MSG}

Login Form Fields with Username Empty
    Input Text    ${USERNAME_ID}    ${EMPTY}
    Input Text    ${PASSWORD_ID}    123
    Click Button    ${LOGIN_BTN_ID}
    Wait Until Element Is Visible    css:.${ERROR_MESSAGE_CLASS}    timeout=10s
    Element Should Contain    css:.${ERROR_MESSAGE_CLASS} h3    ${USERNAME_REQUIRED_MSG}

Fill Login Form with Password Empty
    Input Text    ${USERNAME_ID}    user
    Input Text    ${PASSWORD_ID}    ${EMPTY}
    Click Button    ${LOGIN_BTN_ID}
    Wait Until Element Is Visible    css:.${ERROR_MESSAGE_CLASS}    timeout=10s
    Element Should Contain    css:.${ERROR_MESSAGE_CLASS} h3    ${PASSWORD_REQUIRED_MSG}

*** Test Cases ***
Scenario: Successful Login to Swag Labs and validation page of products
    [Documentation]    Verify that a user with valid credentials can log in successfully
    Open Browser And Access Site
    Fill Login Form
    Go To Products Page
    # Add any additional validations or checks here

Scenario: Login with Invalid Credentials
    [Documentation]    Verify that an error message is shown when invalid credentials are used
    Open Browser And Access Site
    Fill Login Invalid Form

Scenario: Leave Login Form Fields Empty
    [Documentation]    Verify that an error message is shown when both fields are left empty
    Open Browser And Access Site
    Login Form Fields Empty

Scenario: Leave Username Field Empty
    [Documentation]    Verify that an error message is shown when the username field is left empty
    Open Browser And Access Site
    Login Form Fields with Username Empty

Scenario: Leave Password Field Empty
    [Documentation]    Verify that an error message is shown when the password field is left empty
    Open Browser And Access Site
    Fill Login Form with Password Empty
