Feature: Help

  In order to save time
  As a logic user
  I want help

  Scenario: No command line options shows help
    When I run logic
    Then I should see:
    """
    Usage: logic [ truth_table | mcdc_pairs ] \"<decision>\"
    """

  Scenario: --help shows help
    When I run logic --help
    Then I should see:
    """
    Usage: logic [ truth_table | mcdc_pairs ] \"<decision>\"
    """

  Scenario: -h shows help
    When I run logic -h
    Then I should see:
    """
    Usage: logic [ truth_table | mcdc_pairs ] \"<decision>\"
    """
