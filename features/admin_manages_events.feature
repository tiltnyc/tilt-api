Feature: Admin manages events
  As an admin, I can create an event

  Scenario: Admin can create an event
    Given I am logged in as an admin
    And I am on the admin dashboard
    When I click "Events"
    Then I should see "New Event"
    When I click "New Event"
    Then I should see "New Event"
    When I fill in "event[name]" with "Gangnam"
    And I fill in "event[theme]" with "Style"
    And I fill in "event[start_date]" with "09/29/2012"
    And I press "Save"
    And I should see "Gangnam created"
