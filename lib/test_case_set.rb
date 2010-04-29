require 'test_case'

class TestCaseSet

  def initialize(condition_count, decision, condition_identifiers = nil)
    @condition_identifiers = condition_identifiers
    @condition_count = condition_count
    @decision = decision
    @test_cases = create_cases
  end

  def create_cases
    case_numbers.map do |case_number|
      TestCase.new(case_number, @condition_count, @decision)
    end
  end

  def case_numbers
    1..2**@condition_count
  end

  def input_to_condition_mapping
    input_identifiers.zip(@condition_identifiers)
  end

  def input_identifiers
    identifier_range.take(@condition_count)
  end

  def identifier_range
    'a'..'z'
  end

  def mcdc_pairs
    input_identifiers.map do |condition_identifier|
      "#{condition_identifier} => #{mcdc_pairs_for(condition_identifier)}"
    end
  end

  def mcdc_pairs_for(condition_identifier)
    @test_cases.inject([]) do |mcdc_cases, test_case|
      mcdc_pair = test_case.mcdc_pair(index_of(condition_identifier))
      mcdc_cases << mcdc_pair if test_case.is_mcdc_case_for_index?(index_of(condition_identifier))
      mcdc_cases
    end.uniq
  end

  def index_of(condition_identifier)
    identifier_range.to_a.index(condition_identifier)
  end

  def count
    @test_cases.count
  end

  def formatted(format)
    @test_cases.inject("") do |output, test_case|
      output += test_case.formatted(format)
    end
  end

end
