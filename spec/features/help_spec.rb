require 'spec_helper'

RSpec.describe 'Help', type: :aruba do
  it 'shows help given no command line options' do
    run_command 'logic'
    should_see_help
  end

  it 'shows help given --help' do
    run_command 'logic --help'
    should_see_help
  end

  it 'shows help given -h' do
    run_command 'logic -h'
    should_see_help
  end

  def should_see_help
    should_see_output 'Usage: logic [options] <decision>'
  end
end
