require 'truth_table'

module LogicStatement

  def truth_table
    TruthTable.new(condition_count) { |conditions| evaluate(conditions) }
  end

  def mcdc_cases
    truth_table.mcdc_cases
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
    conditions.shift
  end

end

module Decision

  include LogicStatement
  
  def condition_identifiers
    elements.map(&:condition_identifiers).flatten
  end

  def evaluate(conditions)
    condition_1 = operand_1.evaluate(conditions)
    condition_2 = operand_2.evaluate(conditions)
    operator.apply(condition_1, condition_2)
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
