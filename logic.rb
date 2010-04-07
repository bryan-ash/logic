$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")

require 'rubygems'
require 'treetop'
require 'logic_parser'
require 'logic_testing'

parser = LogicParser.new
decision = parser.parse ARGV[1]

if ARGV[0] == 'truth_table'
  puts decision.truth_table
end

if ARGV[0] == 'mcdc_pairs'
  puts decision.mcdc_pairs
end  
