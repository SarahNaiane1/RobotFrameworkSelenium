*** Settings ***
Resource   ../resources/login_keywords.robot
Library    SeleniumLibrary

*** Variables ***
${MENU}              id:react-burger-menu-btn
${MENU_ALL_ITEMS}    id:inventory_sidebar_link
${CLOSE_MENU}        id:react-burger-cross-btn
${PAGE_HEADER}       id:inventory_sidebar_link 

*** Test Cases ***
Scenario: Successful Login to Swag Labs and Validation Page of Products
    [Documentation]    Verify that a user with valid credentials can log in successfully and navigate to the products page
    Login With Valid Credentials
    Go To    https://www.saucedemo.com/inventory.html
    # Optionally, add validation here to ensure you are on the correct page
    Close All Browsers

Scenario: Click Menu on All Items
    [Documentation]    Click the menu button to view all items and verify navigation
    Login With Valid Credentials
    Wait Until Element Is Visible    ${MENU}    timeout=10s
    Click Element    ${MENU}
    Wait Until Element Is Visible    ${MENU_ALL_ITEMS}    timeout=10s
    Click Element    ${MENU_ALL_ITEMS}
    Wait Until Element Is Visible    ${PAGE_HEADER}    timeout=10s
    Element Text Should Be    ${PAGE_HEADER}    All Items
    Close All Browsers

Scenario: Close Menu
    [Documentation]    Click the menu button, select an item, and then close the menu
    Login With Valid Credentials
    Wait Until Element Is Visible    ${MENU}    timeout=10s
    Click Element    ${MENU}
    Wait Until Element Is Visible    ${MENU_ALL_ITEMS}    timeout=10s
    Click Element    ${MENU_ALL_ITEMS}
    Wait Until Element Is Visible    ${CLOSE_MENU}    timeout=10s
    Click Element    ${CLOSE_MENU}
