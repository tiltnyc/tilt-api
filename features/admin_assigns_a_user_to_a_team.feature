Feature: Admin assigns users to a team
  As an admin, I can assign a user to a team

  Scenario: Admin assigns a user to a team
    Given I am logged in as an admin
    And an event exists with the following:
      | name    | theme | start_date |
      | Gangnam | Style | 12/11/2012 |
    And a team exists with the following:
      | name     | event         |
      | Team One | name: Gangnam |
    And a user exists with the following:
      | name      | email                 |
      | Ryan Dahl | ryan.dahl@example.com |
    And I am on the admin dashboard
    And I click "Events"
    And I click "Teams"
    And I click "Competitors"
    And I click "Add Competitor"
    When I select "Ryan Dahl" from the available users list
    And I press "Add"
    Then I should see "Ryan Dahl added to Team One"
