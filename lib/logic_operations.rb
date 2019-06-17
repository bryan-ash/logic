require 'test_case_set'
require 'truth_table'

class Treetop::Runtime::SyntaxNode
  def condition_identifiers
    []
  end
end

module Decision
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
  include Decision

  def condition_identifiers
    [text_value]
  end

  def evaluate(conditions)
    conditions.shift
  end
end

module BinaryDecision
  include Decision

  def condition_identifiers
    elements.flat_map(&:condition_identifiers)
  end

  def evaluate(conditions)
    left_value = left.evaluate(conditions)
    return left_value unless tail.elements.any?

    tail.elements.reduce(left_value) do |value, tail|
      tail.operator.apply(value, tail.operand.evaluate(conditions))
    end
  end
end

module Tail
  def condition_identifiers
    elements.flat_map do |element|
      element.elements.flat_map(&:condition_identifiers)
    end
  end
end

module Negation
  include Decision

  def condition_identifiers
    operand.condition_identifiers
  end

  def evaluate(conditions)
    negate(operand.evaluate(conditions))
  end

  def negate(value)
    1 ^ value
  end
end

module Parenthesized
  include Decision

  def condition_identifiers
    contents.condition_identifiers
  end

  def evaluate(conditions)
    contents.evaluate(conditions)
  end
end

module And
  def apply(a, b)
    a & b
  end
end

module Or
  def apply(a, b)
    a | b
  end
end

module Xor
  def apply(a, b)
    a ^ b
  end
end
