Feature: Admin manages events
  As an admin, I can create an event

  Background:
    Given I am logged in as an admin
    And I am on the admin dashboard
    And an event exists with the following:
      | name    | theme | start_date |
      | Gangnam | Style | 12/11/2012 |

  Scenario: Admin can create teams for an event
    When I click "Events"
    And I click "Teams"
    And I click "New Team"
    Then I should see "New Team for Gangnam"
    When I fill in the team name with "Team One"
    And I press "Save"
    Then I should see "Team One created"

  Scenario: Admin edits a team's name
    And a team exists with the following:
      | name     | event         |
      | Team One | name: Gangnam |
    When I click "Events"
    And I click "Teams"
    Then I should see "Team One"
    When I click "edit"
    And I fill in the team name with "Team fAwesome"
    And I press "Save"
    Then I should see "Team fAwesome updated"
