require 'rubygems'
require 'treetop'
require 'logic_parser'
require 'logic_testing'

describe LogicParser do

  let(:parser) { LogicParser.new }

  describe "parsing a single condition" do
    
    let(:decision) { parser.parse('Hello') }
    
    it "identifies the condition" do
      decision.condition_identifiers.should == ['Hello']
    end

    it "has 1 condition" do
      decision.condition_count.should == 1
    end

  end

  describe "parsing 'A or B'" do

    let(:decision) { parser.parse('A or B') }
    
    it "condition identifiers are ['A','B']" do
      decision.condition_identifiers.should == ['A','B']
    end

    it "has 2 conditions" do
      decision.condition_count.should == 2
    end

  end

  describe "parsing 'A or B or C'" do

    let(:decision) { parser.parse('A or B or C') }
    
    it "condition identifiers are ['A','B','C']" do
      decision.condition_identifiers.should == ['A','B', 'C']
    end

    it "has 3 conditions" do
      decision.condition_count.should == 3
    end

  end

  describe "parsing 'A and B'" do

    let(:decision) { parser.parse('A and B') }
    
    it "conditions are ['A','B']" do
      decision.condition_identifiers.should == ['A','B']
    end

    it "has 2 conditions" do
      decision.condition_count.should == 2
    end

  end

  describe "parsing 'A and B and C'" do

    let(:decision) { parser.parse('A and B and C') }
    
    it "condition identifiers are ['A','B','C']" do
      decision.condition_identifiers.should == ['A','B', 'C']
    end

    it "has 3 conditions" do
      decision.condition_count.should == 3
    end

  end

  { 'Hello' =>
    { [0] => 0,
      [1] => 1
    },
    'A or B' =>
    { [0, 0] => 0,
      [0, 1] => 1,
      [1, 0] => 1
    },
    'A and B' =>
    { [1, 1] => 1,
      [0, 1] => 0,
      [1, 0] => 0
    },
    'A or B or C' =>
    { [0, 0, 0] => 0,
      [1, 0, 0] => 1,
      [0, 1, 0] => 1,
      [0, 0, 1] => 1
    },
    'A and B and C' =>
    { [1, 1, 1] => 1,
      [0, 1, 1] => 0,
      [1, 0, 1] => 0,
      [1, 1, 0] => 0
    },
    '(A and B) or C' =>
    { [1, 1, 0] => 1,
      [0, 1, 0] => 0,
      [1, 0, 0] => 0,
      [0, 0, 1] => 1
    },
    'A and (B or C)' =>
    { [1, 0, 0] => 0,
      [1, 1, 0] => 1,
      [1, 0, 1] => 1,
      [0, 1, 1] => 0
    }
  }.each do |logic, cases|
    describe "parsing '#{logic}'" do

      let(:decision) { parser.parse(logic) }

      cases.each do |conditions, result|
        it "'#{conditions}' evaluates to '#{result}'" do
          decision.evaluate(conditions).should == result
        end
      end
    end

  end

end
