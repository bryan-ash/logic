class TruthTable
  def initialize(test_cases)
    @test_cases = test_cases
  end

  def to_s
    formatted_input_to_condition_maping + "\n" +
      table_header + "\n" +
      formatted_cases + "\n"
  end

  def formatted_input_to_condition_maping
    @test_cases.formatted_input_to_condition_maping("%s <= %s\n")
  end

  def table_header
    "    %s | output" % @test_cases.input_identifiers.join(" ")
  end

  def formatted_cases
    @test_cases.formatted("%2d) %s | %3d\n")
  end
end
