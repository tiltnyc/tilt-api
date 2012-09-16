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
    And I click "Add a team to Gangnam"
    Then I should see "New Team for Gangnam"
