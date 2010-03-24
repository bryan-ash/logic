When /^I run (.+) '(.+)'$/ do |ruby_file, decision|
  When "I run \"ruby #{APP_PATH}/#{ruby_file}.rb '#{decision}'\""
end
