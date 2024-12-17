*** Variables ***

# Login Page Locators
${LOGIN_PAGE_URL}        https://www.saucedemo.com/
${USERNAME_FIELD}        id:user-name
${PASSWORD_FIELD}        id:password
${LOGIN_BUTTON}          id:login-button

# Login Page Error Locators
${ERR_USER_PASS_MISMATCH}   //h3[@data-test='error' and contains(text(),'Epic sadface: Username and password do not match any user in this service')]
${ERR_USER_PASS_EMPTY}   //h3[@data-test='error' and contains(text(),'Epic sadface: Username is required')]

# Products Page Locators
${PRODUCTS_HEADER}       xpath=//span[text()='Products']
${SWAG_LABS_LOGO}        xpath=//div[@class='app_logo' and contains(text(), 'Swag Labs')]
${SHOPPING_CART_ICON}    xpath=//a[@class ='shopping_cart_link']
${BURGER_MENU_BUTTON}    xpath=//button[@id='react-burger-menu-btn']
${PRODUCT_NAME}          xpath=//div[@data-test='inventory-item-name' and text()='<product_name>']
${ADD_TO_CART_TEMPLATE}  xpath=//button[@id='add-to-cart-<product_name>' and text()='Add to cart']
${REMOVE_CART_BTN}       xpath=//button[@id='remove-<product_name>' and text()='Remove']
${SHOPPING_CART_BADGE}   xpath=//span[@class='shopping_cart_badge' and text()='<items_count>']
${LOG_OUT_BTN}           id:logout_sidebar_link