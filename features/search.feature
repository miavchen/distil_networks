Feature: Homepage
  Homepage tests

  Scenario: Search should return exactly one result for “Cam Lock Nut #103114”
    Given I am on the homepage
    And I search for  “Cam Lock Nut #103114”
    Then I should get exactly one result
