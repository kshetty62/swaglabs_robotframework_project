*** Settings ***
Resource    ../resources/ui_keywords.robot
Resource    ../resources/variables.robot


Test Teardown      Close Browser
*** Test Cases ***

#robot --loglevel DEBUG -i TC-07 --outputdir reports testcases/ui_tests.robot

#Feature: Login to Swag Labs---------------------------------------

Valid login with correct credentials
    [Documentation]   Verify successful login using valid credentials.
    Given I am on the Swag Labs login page
    When I enter username and password    ${VALID_USERNAME}     ${VALID_PASSWORD}
    And I click the login button
    Then I should be redirected to the products page


Invalid login with incorrect credentials
    [Documentation]   Validate that invalid username with a valid password results in an error message.
    Given I am on the Swag Labs login page
    When I enter username and password    ${INVALID_USERNAME}     ${VALID_PASSWORD}
    And I click the login button
    Then I should see an error message "Epic sadface: Username and password do not match any user in this service"

Attempt login with empty fields
    [Documentation]  Validate that leaving username and password fields empty results in an error message.
    Given I am on the Swag Labs login page
    When I click the login button
    Then I should see an error message "Epic sadface: Username is required"


#Feature: Add items to the shopping cart-------------------------------------

Add a single item to the cart
    Given I am logged into Swag Labs
    And I am on the products page
    When I click on the "Add to cart" button for a product    Sauce Labs Backpack
    Then the cart badge should display   1

Add multiple items to the cart
    Given I am logged into Swag Labs
    And I am on the products page
    When I click on the "Add to cart" button for a product    Sauce Labs Backpack
    And I click on the "Add to cart" button for a product     Sauce Labs Bike Light
    Then the cart badge should display   2

Remove an item from the cart
    Given I am logged into Swag Labs
    And I am on the products page
    And I click on the "Add to cart" button for a product    Sauce Labs Backpack
    And I click on the "Add to cart" button for a product     Sauce Labs Bike Light
    When I remove an item from cart        Sauce Labs Backpack
    Then the cart badge should display   1

#Feature: Logout from Swag Labs----------------------

Successful logout
    [Documentation]   Verifies if the logout functionality works as expected
    [Tags]      TC-07        
    Given I am logged into Swag Labs
    When I click on the menu button
    And I click on the "Logout" option
    Then I should be redirected to the login page

#Feature: Sort products on the products page
#
#  Scenario: Sort products by price (low to high)
#    Given I am logged into Swag Labs
#    And I am on the products page
#    When I select "Price (low to high)" from the sorting dropdown
#    Then the products should be sorted by price in ascending order
#
#  Scenario: Sort products by price (high to low)
#    Given I am logged into Swag Labs
#    And I am on the products page
#    When I select "Price (high to low)" from the sorting dropdown
#    Then the products should be sorted by price in descending order


#Feature: Checkout process
#
#  Scenario: Successful checkout
#    Given I have added items to my cart
#    And I am on the cart page
#    When I click on the "Checkout" button
#    And I enter "John" as the first name
#    And I enter "Doe" as the last name
#    And I enter "12345" as the postal code
#    And I click the "Continue" button
#    Then I should see the checkout overview page
#    When I click on the "Finish" button
#    Then I should see the confirmation message "THANK YOU FOR YOUR ORDER"
#
#  Scenario: Checkout with missing details
#    Given I am on the checkout page
#    When I leave the first name field empty
#    And I click the "Continue" button
#    Then I should see an error message "Error: First Name is required"




#E2E testcases

#Feature: Complete a purchase on Swag Labs
#
#  Scenario: Valid login and successful purchase
#    Given I am on the Swag Labs login page
#    When I log in with username "standard_user" and password "secret_sauce"
#    Then I should be redirected to the products page
#
#    When I add "Sauce Labs Backpack" and "Sauce Labs Bike Light" to the cart
#    And I click on the cart icon
#    Then I should see both products in the cart
#
#    When I click on the "Checkout" button
#    And I enter "John" as the first name
#    And I enter "Doe" as the last name
#    And I enter "12345" as the postal code
#    And I click the "Continue" button
#    Then I should see the checkout overview page with the selected products
#
#    When I click on the "Finish" button
#    Then I should see the confirmation message "THANK YOU FOR YOUR ORDER"
#
#
#Feature: Sort products and add to cart
#
#  Scenario: Sort by price and purchase the cheapest item
#    Given I am on the Swag Labs login page
#    When I log in with username "standard_user" and password "secret_sauce"
#    Then I should be redirected to the products page
#
#    When I sort products by "Price (low to high)"
#    Then the cheapest product should appear first
#
#    When I add the first product to the cart
#    And I click on the cart icon
#    Then I should see the selected product in the cart
#
#    When I proceed to checkout
#    And I enter "Jane" as the first name
#    And I enter "Doe" as the last name
#    And I enter "54321" as the postal code
#    And I complete the checkout process
#    Then I should see the confirmation message "THANK YOU FOR YOUR ORDER"
#
#
#Feature: User login and logout
#
#  Scenario: Validate session management after logout
#    Given I am on the Swag Labs login page
#    When I log in with username "standard_user" and password "secret_sauce"
#    Then I should be redirected to the products page
#
#    When I click on the menu button
#    And I click on the "Logout" option
#    Then I should be redirected to the login page
#
#    When I try to navigate to the products page without logging in
#    Then I should be redirected back to the login page
#
#
#Feature: Add and remove items from cart before purchase
#
#  Scenario: Add items to cart, remove one, and complete checkout
#    Given I am on the Swag Labs login page
#    When I log in with username "standard_user" and password "secret_sauce"
#    Then I should be redirected to the products page
#
#    When I add "Sauce Labs Backpack" and "Sauce Labs Fleece Jacket" to the cart
#    And I click on the cart icon
#    Then I should see both products in the cart
#
#    When I remove "Sauce Labs Backpack" from the cart
#    Then only "Sauce Labs Fleece Jacket" should be displayed in the cart
#
#    When I proceed to checkout
#    And I enter "Mike" as the first name
#    And I enter "Ross" as the last name
#    And I enter "67890" as the postal code
#    And I complete the checkout process
#    Then I should see the confirmation message "THANK YOU FOR YOUR ORDER"
#
#
#Feature: Handle invalid login and retry with valid credentials
#
#  Scenario: Attempt login with invalid credentials and retry
#    Given I am on the Swag Labs login page
#    When I try to log in with username "locked_out_user" and password "secret_sauce"
#    Then I should see an error message "Epic sadface: Sorry, this user has been locked out."
#    When I re-enter username "standard_user" and password "secret_sauce"
#    And I click the login button
#    Then I should be redirected to the products page
#
#
#
