class TruthTable

  def initialize(test_cases)
    @test_cases = test_cases
  end

  def to_s
    header + formatted_cases + "\n"
  end

  def header
    "    %s | output\n" % @test_cases.input_identifiers.join(" ")
  end

  def formatted_cases
    @test_cases.inject("") do |output, test_case|
      output += test_case.formatted("%2d) %s | %3d\n")
    end
  end

end
