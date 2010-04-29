class TruthTable

  def initialize(test_cases)
    @test_cases = test_cases
  end

  def to_s
    input_to_condition_maping + "\n" +
      table_header + "\n" +
      formatted_cases + "\n"
  end

  def input_to_condition_maping
    @test_cases.input_to_condition_mapping.inject("") do |output, input_condition_pair|
      output += "%s <= %s\n" % input_condition_pair
    end
  end

  def table_header
    "    %s | output" % @test_cases.input_identifiers.join(" ")
  end

  def formatted_cases
    @test_cases.formatted("%2d) %s | %3d\n")
  end

end
