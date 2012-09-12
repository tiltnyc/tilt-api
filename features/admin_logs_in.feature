Feature: Admin logs in and logs out
  As an admin, I can log in and out

  Background:
    Given an admin exists with the following information:
      | username | password | name          |
      | admin    | nimda    | Admin McAdmin |
    When I am on the homepage
    And I click "Login"
    And I fill in "admin[username]" with "admin"
    And I fill in "admin[password]" with "nimda"

  Scenario: Admin logs in
    When I press "Login"
    Then I should see "Logged in as Admin"

  Scenario: Admin logs out
    When I press "Login"
    Then I should see "Logged in as Admin"
    But I should not see "Login"
    When I click "Log Out"
    Then I should see "Login"
    But I should not see "Log Out"
