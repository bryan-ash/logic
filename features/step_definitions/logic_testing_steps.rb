When /^I run (.+) 'a'$/ do |ruby_file|
  When "I run \"ruby #{APP_PATH}/#{ruby_file}.rb 'a'\""
end
