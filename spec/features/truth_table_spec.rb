require 'spec_helper'

RSpec.describe 'Truth Table', type: :aruba do
  it 'input names are related to condition names' do
    run_command "logic Jennifer or Juliette"
    should_see_output <<~STR
      a <= Jennifer
      b <= Juliette
    STR
  end

  it 'a single condition' do
    run_command "logic --truth_table --no-mcdc-pairs 'a'"
    should_see_output <<~STR
      a <= a

          a | output
       1) 0 |   0
       2) 1 |   1
    STR
  end

  it 'Truth table output is not mandatory' do
    run_command "logic --no-truth_table 'a'"
    should_not_see_output 'a | output'
  end

  it 'Truth table is output by default' do
    run_command "logic --no-mcdc-pairs 'a'"
    should_see_output <<~STR
      a <= a

          a | output
       1) 0 |   0
       2) 1 |   1
    STR
  end

  it 'a negated condition' do
    run_command "logic --truth_table --no-mcdc-pairs 'not a'"
    should_see_output <<~STR
      a <= a

          a | output
       1) 0 |   1
       2) 1 |   0
    STR
  end

  it "'a or b' decision" do
    run_command "logic --truth_table --no-mcdc-pairs 'a or b'"
    should_see_output <<~STR
      a <= a
      b <= b

          a b | output
       1) 0 0 |   0
       2) 0 1 |   1
       3) 1 0 |   1
       4) 1 1 |   1
    STR
  end

  it "'a xor b' decision" do
    run_command "logic --truth_table --no-mcdc-pairs 'a xor b'"
    should_see_output <<~STR
      a <= a
      b <= b

          a b | output
       1) 0 0 |   0
       2) 0 1 |   1
       3) 1 0 |   1
       4) 1 1 |   0
    STR
  end

  it "'not a or not b' decision" do
    run_command "logic --truth_table --no-mcdc-pairs 'not a or not b'"
    should_see_output <<~STR
      a <= a
      b <= b

          a b | output
       1) 0 0 |   1
       2) 0 1 |   1
       3) 1 0 |   1
       4) 1 1 |   0
    STR
  end

  it "'a or b or c' decision" do
    run_command "logic --truth_table --no-mcdc-pairs 'a or b or c'"
    should_see_output <<~STR
      a <= a
      b <= b
      c <= c

          a b c | output
       1) 0 0 0 |   0
       2) 0 0 1 |   1
       3) 0 1 0 |   1
       4) 0 1 1 |   1
       5) 1 0 0 |   1
       6) 1 0 1 |   1
       7) 1 1 0 |   1
       8) 1 1 1 |   1
    STR
  end

  it "'a and b and c' decision" do
    run_command "logic --truth_table --no-mcdc-pairs 'a and b and c'"
    should_see_output <<~STR
      a <= a
      b <= b
      c <= c

          a b c | output
       1) 0 0 0 |   0
       2) 0 0 1 |   0
       3) 0 1 0 |   0
       4) 0 1 1 |   0
       5) 1 0 0 |   0
       6) 1 0 1 |   0
       7) 1 1 0 |   0
       8) 1 1 1 |   1
    STR
  end

  it "'(a and b) or c' decision" do
    run_command "logic --truth_table --no-mcdc-pairs '(a and b) or c'"
    should_see_output <<~STR
      a <= a
      b <= b
      c <= c

          a b c | output
       1) 0 0 0 |   0
       2) 0 0 1 |   1
       3) 0 1 0 |   0
       4) 0 1 1 |   1
       5) 1 0 0 |   0
       6) 1 0 1 |   1
       7) 1 1 0 |   1
       8) 1 1 1 |   1
    STR
  end
end
