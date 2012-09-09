Feature: Admin creates an Event
  As an admin, I can create an event

  Scenario: There is a view results link next to all my completed actions
    Given an admin exists with the following information:
      | username | password | name          |
      | admin    | nimda    | Admin McAdmin |
    And I am on the homepage
    When I go to the admin login page
    And I fill in "admin[username]" with "admin"
    And I fill in "admin[password]" with "nimda"
    When I press "Login"
    Then I should see "Logged in as Admin"
