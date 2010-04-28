Feature: Help

  In order to save time
  As a logic user
  I want help

  Scenario: No command line options shows help
    When I run logic
    Then I should see some help

  Scenario: --help shows help
    When I run logic --help
    Then I should see some help

  Scenario: -h shows help
    When I run logic -h
    Then I should see some help
