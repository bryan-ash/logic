Feature: Truth Table

  In order to appreciate the complexity of a logic statement
  as an engineer
  I want to see the truth table

  Scenario: input names are related to condition names
    When I run logic Jennifer or Juliette
    Then I should see:
      """
      a <= Jennifer
      b <= Juliette
      """

  Scenario: a single condition
    When I run logic --truth_table 'a'
    Then I should see:
      """
          a | output
       1) 0 |   0
       2) 1 |   1
      """

  Scenario: Truth table output is not mandatory
    When I run logic --no-truth_table 'a'
    Then I should not see:
      """
          a | output
       1) 0 |   0
       2) 1 |   1
      """

  Scenario: Truth table is output by default
    When I run logic 'a'
    Then I should see:
      """
          a | output
       1) 0 |   0
       2) 1 |   1
      """

  Scenario: a negated condition
    When I run logic --truth_table 'not a'
    Then I should see:
      """
          a | output
       1) 0 |   1
       2) 1 |   0
      """

  Scenario: 'a or b' decision
    When I run logic --truth_table 'a or b'
    Then I should see:
      """
          a b | output
       1) 0 0 |   0
       2) 0 1 |   1
       3) 1 0 |   1
       4) 1 1 |   1
      """

  Scenario: 'a xor b' decision
    When I run logic --truth_table 'a xor b'
    Then I should see:
      """
          a b | output
       1) 0 0 |   0
       2) 0 1 |   1
       3) 1 0 |   1
       4) 1 1 |   0
      """

  Scenario: 'not a or not b' decision
    When I run logic --truth_table 'not a or not b'
    Then I should see:
      """
          a b | output
       1) 0 0 |   1
       2) 0 1 |   1
       3) 1 0 |   1
       4) 1 1 |   0
      """

  Scenario: 'a or b or c' decision
    When I run logic --truth_table 'a or b or c'
    Then I should see:
      """
          a b c | output
       1) 0 0 0 |   0
       2) 0 0 1 |   1
       3) 0 1 0 |   1
       4) 0 1 1 |   1
       5) 1 0 0 |   1
       6) 1 0 1 |   1
       7) 1 1 0 |   1
       8) 1 1 1 |   1
      """

  Scenario: 'a and b and c' decision
    When I run logic --truth_table 'a and b and c'
    Then I should see:
      """
          a b c | output
       1) 0 0 0 |   0
       2) 0 0 1 |   0
       3) 0 1 0 |   0
       4) 0 1 1 |   0
       5) 1 0 0 |   0
       6) 1 0 1 |   0
       7) 1 1 0 |   0
       8) 1 1 1 |   1
      """

  Scenario: '(a and b) or c' decision
    When I run logic --truth_table '(a and b) or c'
    Then I should see:
      """
          a b c | output
       1) 0 0 0 |   0
       2) 0 0 1 |   1
       3) 0 1 0 |   0
       4) 0 1 1 |   1
       5) 1 0 0 |   0
       6) 1 0 1 |   1
       7) 1 1 0 |   1
       8) 1 1 1 |   1
      """
