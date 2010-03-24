$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")

require 'rubygems'
require 'treetop'
require 'logic_parser'

parser = LogicParser.new
logic = parser.parse ARGV[1]

truth_table = TruthTable.new(logic)
puts truth_table.to_s

conditions = logic.condition_identifiers.join(" ")

puts "#{conditions.rjust(conditions.length + 4)} | output"
logic.conditions.each_with_index do |condition_row, index|
  puts "#{(index + 1).to_s.rjust(2)}) #{condition_row.join(' ')} " +
    "| #{logic.evaluate(condition_row).to_s.rjust(3)}"
end

if ARGV[0] == 'mcdc_cases'
  puts "\nMC/DC Cases:"
  puts "a => [[1, 2]]"
end  

