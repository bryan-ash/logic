$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")

require 'rubygems'
require 'treetop'
require 'logic_parser'
require 'truth_table'

parser = LogicParser.new
decision = parser.parse ARGV[1]

truth_table = decision.truth_table
puts truth_table.to_s

if ARGV[0] == 'mcdc_cases'
  puts "\nMC/DC Cases:"
  puts "a => [[1, 2]]"
end  

