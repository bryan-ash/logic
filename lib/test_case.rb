require 'integer'
require 'range'
require 'symbol'

class TestCase

  def initialize(number, condition_count, decision)
    @condition_value = number - 1
    @condition_count = condition_count
    @decision = decision
  end

  def initialize_copy(source)
    super
    @conditions = conditions.dup
  end

  def conditions
    @conditions ||= (@condition_value).to_array_of_bits(@condition_count)
  end

  def number
    conditions.join.to_i(base = 2) + 1
  end

  def output
    @decision.evaluate(conditions.dup)
  end

  def mcdc_pair(index)
    modified_case = negate_condition_at_index(index)
    [number, modified_case.number].sort
  end

  def is_mcdc_case_for_index?(index)
    modified_case = negate_condition_at_index(index)
    modified_case.output != output
  end

  def negate_condition_at_index(index)
    dup.negate_condition_at_index!(index)
  end

  def negate_condition_at_index!(index)
    conditions[index] = conditions[index].negate
    self
  end

  def formatted(format)
    "%2d) %s | %3d\n" % [number, conditions.join(' '), output]
  end

end
