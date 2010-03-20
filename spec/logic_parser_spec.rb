require 'rubygems'
require 'treetop'
require 'logic_parser'
require 'logic_testing'

describe LogicParser do

  let(:parser) { LogicParser.new }

  describe "parsing a single condition" do
    
    it "identifies the condition" do
      parser.parse("Hello").conditions.should == ["Hello"]
    end

    it "truth_table is [0,0], [1,1]]" do
      parser.parse("Hello").truth_table.should == [[0,0], [1,1]]
    end

  end
  
end
