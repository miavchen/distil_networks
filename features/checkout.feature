Feature: Homepage
  Homepage tests

  Scenario: User should be able to initiate the checkout process
    Given I am on the homepage
    And I search for  “Cam Lock Nut #103114”
    And I click on the product
    And I click on Add to Cart
    And I change the quantity to 2
    And click on Checkout
    Then I should be redirected to shopify for checkout

