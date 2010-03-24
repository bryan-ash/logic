Feature: Truth Table

  In order to appreciate the complexity of a logic statement
  as an engineer
  I want to see the truth table

  Scenario: a single condition
    When I run truth_table 'a'
    Then I should see:
      """
          a | output
       1) 0 |   0
       2) 1 |   1
      """

  Scenario: 'a or b' decision
    When I run truth_table 'a or b'
    Then I should see:
      """
          a b | output
       1) 0 0 |   0
       2) 0 1 |   1
       3) 1 0 |   1
       4) 1 1 |   1
      """
