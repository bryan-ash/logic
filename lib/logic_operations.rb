require 'array'
require 'test_case_set'
require 'truth_table'

module LogicStatement

  def test_cases
    @test_cases ||= TestCaseSet.new(condition_identifiers, self)
  end

  def truth_table
    TruthTable.new(test_cases)
  end

  def mcdc_pairs
    test_cases.mcdc_pairs
  end

end

module Condition

  include LogicStatement
  
  def condition_identifiers
    [text_value]
  end

  def evaluate(conditions)
    conditions.shift
  end

end

module Decision

  include LogicStatement
  
  def condition_identifiers
    elements.map(&:condition_identifiers).flatten
  end

  def evaluate(conditions)
    left  = operand_1.evaluate(conditions)
    right = operand_2.evaluate(conditions)
    operator.apply(left, right)
  end

end

module Parenthesized

  include LogicStatement

  def condition_identifiers
    binary_condition.condition_identifiers
  end

  def evaluate(conditions)
    binary_condition.evaluate(conditions)
  end
  
end

module NonCondition
  
  def condition_identifiers
    []
  end

end
