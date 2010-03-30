$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")

require 'rubygems'
require 'treetop'
require 'logic_parser'

parser = LogicParser.new
decision = parser.parse ARGV[1]

if ARGV[0] == 'truth_table'
  puts decision.truth_table.to_s
end

if ARGV[0] == 'mcdc_cases'
  puts "\nMC/DC Cases:"
  puts "a => [[1, 2]]"
end  

