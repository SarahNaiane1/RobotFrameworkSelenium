Feature: Login Functionality

  Scenario: Successful Login to Swag Labs and Validation Page of Products
    Given I am on the login page
    When I enter valid credentials
    Then I should be redirected to the products page

  Scenario: Login with invalid credentials
    Given I am on the login page
    When I enter invalid credentials
    Then I should see an error message

  Scenario: Leave login form fields empty
    Given I am on the login page
    When I leave the login form fields empty
    Then I should see an error message indicating that username and password are required

  Scenario: Leave username field empty
    Given I am on the login page
    When I leave the username field empty and enter a password
    Then I should see an error message indicating that the username is required

  Scenario: Leave password field empty
    Given I am on the login page
    When I enter a username and leave the password field empty
    Then I should see an error message indicating that the password is required
