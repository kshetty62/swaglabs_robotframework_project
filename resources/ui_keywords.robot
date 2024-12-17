*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    locators.robot
Resource    variables.robot
Resource    common_keywords.robot




*** Variables ***



*** Keywords ***
#Login page keywords
I am on the Swag Labs login page
    [Documentation]    Open the Swag Labs login page in the browser.
    Open Browser    ${LOGIN_PAGE_URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain Element    ${USERNAME_FIELD}
    Page Should Contain Element   ${PASSWORD_FIELD}

I enter username and password
    [Arguments]    ${username}  ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}

I click the login button
    Mouse Over      ${LOGIN_BUTTON}
    Capture Page Screenshot    EMBED
    Click Button    ${LOGIN_BUTTON}

I am logged into Swag Labs
   I am on the Swag Labs login page
   I enter username and password     ${VALID_USERNAME}     ${VALID_PASSWORD}
   I click the login button     


I should see an error message "Epic sadface: Username and password do not match any user in this service"
    Wait Until Element Is Visible    ${ERR_USER_PASS_MISMATCH}
    Capture Page Screenshot    EMBED

I should see an error message "Epic sadface: Username is required"
   Wait Until Element Is Visible    ${ERR_USER_PASS_EMPTY}
   Capture Page Screenshot    EMBED

#Product page keywords

I click on the menu button
    Wait Until Element Is Visible  ${BURGER_MENU_BUTTON}
    Click Element    ${BURGER_MENU_BUTTON}

I click on the "Logout" option
   Wait Until Element Is Visible  ${LOG_OUT_BTN}
   Mouse Over   ${LOG_OUT_BTN}
   Click Element  ${LOG_OUT_BTN}

I should be redirected to the products page
   [Documentation]    Ensure all key elements on the product page are visible using a loop.
    @{elements}=  Create List    ${PRODUCTS_HEADER}    ${SWAG_LABS_LOGO}    ${SHOPPING_CART_ICON}    ${BURGER_MENU_BUTTON}
    FOR    ${element}    IN    @{elements}
        Element Should Be Visible    ${element}
    END
    Capture Page Screenshot    EMBED

I should be redirected to the login page
   Wait Until Element Is Visible  ${LOGIN_BUTTON}
   Page Should Contain Element    ${USERNAME_FIELD}
   Page Should Contain Element    ${PASSWORD_FIELD}
   Page Should Contain Element    ${LOGIN_BUTTON}
   Capture Page Screenshot        EMBED

I am on the products page
   I should be redirected to the products page

I click on the "Add to cart" button for a product
    [Documentation]    Adds a specified product to the cart with hyphenated lowercase format.
    [Arguments]        ${product_name}
    ${hyphenated_name}=    Convert To Hyphenated Lowercase    ${product_name}
    ${add_to_cart_locator}=    Replace String    ${ADD_TO_CART_TEMPLATE}    <product_name>    ${hyphenated_name}
    Wait Until Element Is Visible  ${add_to_cart_locator}
    Scroll Element Into View    ${add_to_cart_locator}
    Click Element       ${add_to_cart_locator}

the cart badge should display
   [Documentation]    verifies the number on cart
   [Arguments]        ${count}
   ${cart_count_to_verify}=    Replace String    ${SHOPPING_CART_BADGE}    <items_count>    ${count}
   Wait Until Element Is Visible    ${cart_count_to_verify}    timeout=5
   Scroll Element Into View         ${cart_count_to_verify}
   Element Should Be Visible   ${cart_count_to_verify}
   Capture Page Screenshot    EMBED

I remove an item from cart
   [Arguments]        ${product_name}
   ${hyphenated_name}=    Convert To Hyphenated Lowercase    ${product_name}
   ${item_to_remove}=    Replace String    ${REMOVE_CART_BTN}    <product_name>    ${hyphenated_name}
   Scroll Element Into View         ${item_to_remove}
   Click Element   ${item_to_remove}
   Capture Page Screenshot    EMBED

