When /^I run (.+) (.+) '(.+)'$/ do |ruby_file, command, decision|
  When "I run \"ruby #{APP_PATH}/#{ruby_file}.rb #{command} '#{decision}'\""
end
