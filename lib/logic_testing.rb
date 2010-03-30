require 'integer'
require 'test_case'
require 'truth_table'

module LogicStatement

  def truth_table
    TruthTable.new(condition_identifiers, test_cases)
  end

  def mcdc_cases
    "a => [[1, 2]]"
  end

  def test_cases
    conditions.inject([]) do |cases, condition|
      cases << TestCase.new(cases.count + 1, condition, evaluate(condition))
    end
  end

  def conditions
    (0..(2**condition_count - 1)).map do |value|
      value.to_array_of_bits(condition_count)
    end
  end

  def condition_count
    condition_identifiers.count
  end

end

module Condition

  include LogicStatement
  
  def condition_identifiers
    [text_value]
  end

  def evaluate(conditions)
    conditions[0]
  end

end

module Decision

  include LogicStatement
  
  def condition_identifiers
    elements.map(&:condition_identifiers).flatten
  end

  def evaluate(conditions)
    condition_1 = operand_1.evaluate(conditions[0])
    condition_2 = operand_2.evaluate(conditions[1])
    operator.apply(condition_1, condition_2)
  end

end

module NonCondition
  
  def condition_identifiers
    []
  end

end
