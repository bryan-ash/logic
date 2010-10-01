Then /^I should see:$/ do |partial_output|
  combined_output.should =~ regexp(partial_output)
end

Then /^I should not see:$/ do |partial_output|
  combined_output.should_not =~ regexp(partial_output)
end
