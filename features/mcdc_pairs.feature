Feature: MC/DC Pairs

  In order to reduce the number of tests required for a logic statment
  as an engineer
  I want to see the MC/DC test pairs

  Scenario: a single condition
    When I run logic --mcdc_pairs 'a'
    Then I should see:
      """
      a => [[1, 2]]
      """

  Scenario: 'a and b' decision
    When I run logic --mcdc_pairs 'a and b'
    Then I should see:
      """
      a => [[2, 4]]
      b => [[3, 4]]
      """

  Scenario: 'a or b' decision
    When I run logic --mcdc_pairs 'a or b'
    Then I should see:
      """
      a => [[1, 3]]
      b => [[1, 2]]
      """

  Scenario: 'a and (b or c)' decision
    When I run logic --mcdc_pairs 'a and (b or c)'
    Then I should see:
      """
      a => [[2, 6], [3, 7], [4, 8]]
      b => [[5, 7]]
      c => [[5, 6]]
      """
