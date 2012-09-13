Feature: Admin manages events
  As an admin, I can create an event

  Background:
    Given I am logged in as an admin
    And I am on the admin dashboard

  Scenario: Admin can create an event
    When I click "Events"
    Then I should see "New Event"
    When I click "New Event"
    And I fill in "event[name]" with "Gangnam"
    And I fill in "event[theme]" with "Style"
    And I fill in "event[start_date]" with "09/29/2012"
    And I press "Save"
    Then I should see "Gangnam created"
    And I should see "Gangnam"
    And I should see "Style"
    And I should see "Sat Sep 29"

  Scenario: Admin can view an event
    Given an event exists with the following:
      | name    | theme | start_date |
      | Gangnam | Style | 12/11/2012 |
    When I click "Events"
    Then I should see "edit Gangnam"
