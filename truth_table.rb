$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")

require 'rubygems'
require 'treetop'
require 'logic_parser'

parser = LogicParser.new
logic = parser.parse ARGV[0]

conditions = logic.condition_identifiers.join(" ")

puts "#{conditions.rjust(conditions.length + 4)} | output"
logic.conditions.each_with_index do |condition_row, index|
  puts "#{(index + 1).to_s.rjust(2)}) #{condition_row.join(' ')} " +
    "| #{logic.evaluate(condition_row).to_s.rjust(3)}"
end

