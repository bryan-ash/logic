module Condition
  
  def conditions
    [text_value]
  end

  def truth_table
    [[0,0], [1,1]]
  end

end

module Decision

  def conditions
    elements.map(&:conditions).flatten
  end

end

module AndStatement
  
  def conditions
    []
  end

end

module OrStatement
  
  def conditions
    []
  end

end
