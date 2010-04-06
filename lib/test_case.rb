require 'integer'

class TestCase

  attr_reader :number
  
  def initialize(number, condition_count, decision)
    @number = number
    @condition_count = condition_count
    @decision = decision
    @conditions = create_conditions(condition_count)
  end

  def initialize_copy(source)
    super
    @conditions = conditions.dup
  end

  def conditions
    @conditions
  end

  def create_conditions(condition_count)
    value = number - 1
    value.to_array_of_bits(condition_count)
  end

  def evaluate
    @decision.call(@conditions)
  end

  def negate_condition_at_index!(index)
    @conditions[index] = @conditions[index].negate
    self
  end

  def negate_condition_at_index(index)
    dup.negate_condition_at_index!(index)
  end

  def is_mcdc_case_for_index?(index)
    modified_case = negate_condition_at_index(index)
    modified_case.evaluate != evaluate
  end

end
