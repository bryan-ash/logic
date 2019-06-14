require 'spec_helper'

RSpec.describe 'MC/DC Pairs', type: :aruba do
  it 'a single condition' do
    run_command "logic --no-truth-table --mcdc_pairs 'a'"
    should_see_output <<~STR
      a => [[1, 2]]
    STR
  end

  it 'MC/DC pairs are not mandatory output' do
    run_command "logic --no-truth-table --no-mcdc_pairs 'a'"
    should_not_see_output <<~STR
      a => [[1, 2]]
    STR
  end

  it 'MC/DC pairs are output by default' do
    run_command "logic --no-truth-table 'a'"
    should_see_output <<~STR
      a => [[1, 2]]
    STR
  end

  it "'a and b' decision" do
    run_command "logic --no-truth-table --mcdc_pairs 'a and b'"
    should_see_output <<~STR
      a => [[2, 4]]
      b => [[3, 4]]
    STR
  end

  it "'a or b' decision" do
    run_command "logic --no-truth-table --mcdc_pairs 'a or b'"
    should_see_output <<~STR
      a => [[1, 3]]
      b => [[1, 2]]
    STR
  end

  it "'a and (b or c)' decision" do
    run_command "logic --no-truth-table --mcdc_pairs 'a and (b or c)'"
    should_see_output <<~STR
      a => [[2, 6], [3, 7], [4, 8]]
      b => [[5, 7]]
      c => [[5, 6]]
    STR
  end
end
