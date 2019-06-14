module ArubaHelpers
  def should_not_see_output(partial_output)
    expect(last_command_started)
      .to_not have_output(/#{Regexp.quote(partial_output.strip)}/)
  end

  def should_see_output(partial_output)
    expect(last_command_started)
      .to have_output(/#{Regexp.quote(partial_output.strip)}/)
  end
end
