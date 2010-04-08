class TruthTable

  def initialize(test_cases)
    @test_cases = test_cases
  end

  def to_s
    header + formatted_cases
  end

  def header
    conditions = @test_cases.condition_identifiers.join(" ")
    "#{conditions.rjust(conditions.length + 4)} | output\n"
  end

  def formatted_cases
    @test_cases.inject("") do |output, test_case|
      output += "#{test_case.number.to_s.rjust(2)}) #{test_case.conditions.join(' ')} | #{test_case.output.to_s.rjust(3)}\n"
    end
  end

end
