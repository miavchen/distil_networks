Feature: Homepage
  Homepage tests

  Scenario: Shopify cookie should be set when user loads the homepage
    Given I am on the homepage
    Then shopify_s cookie should be set

  Scenario: Page load should be less than 500 ms
    Given I am on the homepage
    Then page load time should be less than 500 ms