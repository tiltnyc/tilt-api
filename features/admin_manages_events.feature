Feature: Admin manages events
  As an admin, I can create an event

  Scenario: Admin can create an event
    Given I am logged in as an admin
    And I am on the admin dashboard
    When I click "Events"
    Then I should see "new Event"
    When I click "new Event"
    Then I should see "new"
