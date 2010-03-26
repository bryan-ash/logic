class TestCase

  attr_reader :conditions
  attr_reader :number
  attr_reader :outcome
  
  def initialize(number, conditions, outcome)
    @number     = number
    @conditions = conditions
    @outcome    = outcome
  end

  def to_s
    "#{number.to_s.rjust(2)}) #{conditions.join(' ')} | #{outcome.to_s.rjust(3)}"
  end

end
