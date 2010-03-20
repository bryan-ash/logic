require 'rubygems'
require 'treetop'
require 'logic_parser'
require 'logic_testing'

describe LogicParser do

  it "Identifies a single condition" do
    parser = LogicParser.new
    parser.parse("Hello").conditions.should == ["Hello"]
  end

  it "exists" do
    parser = LogicParser.new
    parser.parse("Hello").mcdc_cases.should == [[0], [1]]
  end

end
