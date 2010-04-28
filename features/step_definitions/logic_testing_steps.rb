When /^I run ([^\"]+)$/ do |ruby_file|
  When "I run \"#{APP_PATH}/#{ruby_file}\""
end

When /^I run (.+) (.+) "(.+)"$/ do |ruby_file, command, decision|
  When "I run \"#{APP_PATH}/#{ruby_file} #{command} '#{decision}'\""
end
