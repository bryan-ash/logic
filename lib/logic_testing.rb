module LogicStatement
  
  def conditions
    table = []
    0.upto(2**condition_identifiers.length - 1) do |value|
      table << ("%0#{condition_identifiers.length}b" % value).split(//).map(&:to_i)
    end
    table
  end

end

module Condition

  include LogicStatement
  
  def condition_identifiers
    [text_value]
  end

end

module Decision

  include LogicStatement
  
  def condition_identifiers
    elements.map(&:condition_identifiers).flatten
  end

end

module Gate
  
  def condition_identifiers
    []
  end

end
