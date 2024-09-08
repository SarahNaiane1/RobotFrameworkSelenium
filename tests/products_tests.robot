*** Settings ***
Resource   ../resources/login_keywords.robot
Library    SeleniumLibrary

*** Variables ***
${MENU}              id:react-burger-menu-btn
${MENU_ALL_ITEMS}    id:inventory_sidebar_link
${CLOSE_MENU}        id:react-burger-cross-btn
${PAGE_HEADER}       id:inventory_sidebar_link 

*** Test Cases ***
Successful Login to Swag Labs and Validation Page of Products
    [Documentation]    Verify that a user with valid credentials can log in successfully and navigate to the products page
    Open Browser And Access Site
    Fill Login Form    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Go To    https://www.saucedemo.com/inventory.html
    Wait Until Element Is Visible    id:inventory_container    timeout=10s
    Close All Browsers

Click Menu on All Items
    [Documentation]    Click the menu button to view all items and verify navigation
    Login With Valid Credentials
    Wait Until Element Is Visible    ${MENU}    timeout=10s
    Click Element    ${MENU}
    Wait Until Element Is Visible    ${MENU_ALL_ITEMS}    timeout=10s
    Click Element    ${MENU_ALL_ITEMS}
    Wait Until Element Is Visible    ${PAGE_HEADER}    timeout=10s
    Element Text Should Be    ${PAGE_HEADER}    All Items
    Close All Browsers

Close Menu
    [Documentation]    Click the menu button, select an item, and then close the menu
    Login With Valid Credentials
    Wait Until Element Is Visible    ${MENU}    timeout=10s
    Click Element    ${MENU}
    Wait Until Element Is Visible    ${MENU_ALL_ITEMS}    timeout=10s
    Click Element    ${MENU_ALL_ITEMS}
    Wait Until Element Is Visible    ${CLOSE_MENU}    timeout=10s
    Click Element    ${CLOSE_MENU}
    Close All Browsers

Add Sauce Labs Backpack to Cart
    [Documentation]    Verify that clicking "Add to Cart" for Sauce Labs Backpack updates the button to "Remove" and that the item is added to the cart
    Login With Valid Credentials
    Go To    https://www.saucedemo.com/inventory.html
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'inventory_item') and .//div[contains(text(), 'Sauce Labs Backpack')]]    timeout=10s
    Click Element    xpath=//div[contains(@class, 'inventory_item') and .//div[contains(text(), 'Sauce Labs Backpack')]]//button
    Wait Until Element Is Visible    xpath=//button[contains(@id, 'remove-sauce-labs-backpack')]    timeout=10s
    Element Text Should Be    xpath=//button[contains(@id, 'remove-sauce-labs-backpack')]    Remove
    Click Element    css=div#shopping_cart_container
    Wait Until Element Is Visible    xpath=//span[contains(@class, 'shopping_cart_badge')]    timeout=10s
    Element Text Should Be    xpath=//span[contains(@class, 'shopping_cart_badge')]    1
    Close All Browsers