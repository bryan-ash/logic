require 'integer'

class TruthTable

  def initialize(condition_count, &decision)
    @condition_count = condition_count
    @decision = decision
  end

  def condition_identifiers
    ('a'..'z').take(@condition_count)
  end

  def cases
    (0..max_coded_case).map do |value|
      value.to_array_of_bits(@condition_count)
    end
  end

  def mcdc_cases
    condition_identifiers.map do |condition_identifier|
      "#{condition_identifier} => #{mcdc_cases_for(condition_identifier)}"
    end
  end

  def mcdc_cases_for(condition_identifier)
    number = 0
    cases.inject([]) do |mcdc_cases, test_case|
      number += 1
      modified_case = test_case.dup
      modified_case[index_of(condition_identifier)] = modified_case[index_of(condition_identifier)].negate
      modified_output = @decision.call(modified_case)
      output = @decision.call(test_case)
      mcdc_cases << number if modified_output != output
      mcdc_cases
    end
  end

  def index_of(condition_identifier)
    ('a'..'z').to_a.index(condition_identifier)
  end

  def max_coded_case
    2**@condition_count - 1
  end

  def to_s
    header + formatted_cases
  end

  def header
    conditions = condition_identifiers.join(" ")
    "#{conditions.rjust(conditions.length + 4)} | output\n"
  end

  def formatted_cases
    number = 0
    cases.inject("") do |output, conditions|
      number += 1
      output += "#{number.to_s.rjust(2)}) #{conditions.join(' ')} | #{@decision.call(conditions).to_s.rjust(3)}\n"
    end
  end

end
