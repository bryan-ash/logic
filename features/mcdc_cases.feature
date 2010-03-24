Feature: MC/DC Cases

  In order to reduce the number of tests required for a logic statment
  as an engineer
  I want to see the MC/DC test cases

  Scenario: a single condition
    When I run logic mcdc_cases 'a'
    Then I should see:
      """
      a | output | covers
      0 |   0    | a
      1 |   1    | a
      """