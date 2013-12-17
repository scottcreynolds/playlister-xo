Feature: Sign in
  As a user
  I need to be able to sign in
  So that I can use the site specifically for me

  Scenario: Signing In
    Given I exist as a user
    And I am on the sign in page
    When I sign in with valid credentials
    Then I should be on the all songs page