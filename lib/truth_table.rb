class TruthTable

  def initialize(logic)
    @logic = logic
  end

  def to_s
    output = header
    @logic.conditions.each_with_index do |condition_row, index|
      output = output + "\n#{test_number(index + 1)}) #{condition_row.join(' ')} " +
        "| #{@logic.evaluate(condition_row).to_s.rjust(3)}"
    end
    output
  end

  def header
    conditions = @logic.condition_identifiers.join(" ")
    "#{conditions.rjust(conditions.length + 4)} | output"    
  end

  def test_number(number)
    number.to_s.rjust(2)
  end

end
