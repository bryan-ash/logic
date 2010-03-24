$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")

require 'rubygems'
require 'treetop'
require 'logic_parser'

parser = LogicParser.new
logic = parser.parse ARGV[0]

puts "#{logic.condition_identifiers.join(" ")} | output"
logic.conditions.each do |condition_row|
  puts "#{condition_row.join(' ')} | #{logic.evaluate(condition_row).to_s.rjust(3)}"
end

