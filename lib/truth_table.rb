class TruthTable

  def initialize(condition_identifiers, test_cases)
    @condition_identifiers = condition_identifiers
    @test_cases = test_cases
  end

  def to_s
    header + @test_cases.map(&:to_s).join("\n")
  end

  def header
    conditions = @condition_identifiers.join(" ")
    "#{conditions.rjust(conditions.length + 4)} | output\n"    
  end

end
