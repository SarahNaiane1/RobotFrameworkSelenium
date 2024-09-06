*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_SITE}                https://www.saucedemo.com/
${BROWSER}                 chrome
${USERNAME_ID}             id=user-name
${PASSWORD_ID}             id=password
${LOGIN_BTN_ID}            id=login-button
${ERROR_MESSAGE_CLASS}     error-message-container
${USERNAME_REQUIRED_MSG}   Epic sadface: Username is required
${PASSWORD_REQUIRED_MSG}   Epic sadface: Password is required
${VALID_USERNAME}          standard_user
${VALID_PASSWORD}          secret_sauce
${INVALID_USERNAME}        standard_user1
${INVALID_PASSWORD}        secret_sauce1

*** Keywords ***
Open Browser And Access Site
    Open Browser    ${URL_SITE}    ${BROWSER}
    Maximize Browser Window

Fill Login Form
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_ID}    ${username}
    Input Text    ${PASSWORD_ID}    ${password}
    Click Button  ${LOGIN_BTN_ID}

Login With Valid Credentials
    Open Browser And Access Site
    Fill Login Form    ${VALID_USERNAME}    ${VALID_PASSWORD}

Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Open Browser And Access Site
    Fill Login Form    ${username}    ${password}


