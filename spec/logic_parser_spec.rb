require 'rubygems'
require 'treetop'
require 'logic_parser'

describe LogicParser do

  let(:parser) { LogicParser.new }

  describe "parsing a single condition" do
    
    let(:decision) { parser.parse('Hello') }
    
    it "identifies the condition" do
      decision.condition_identifiers.should == ['Hello']
    end

    it "conditions is [[0], [1]]" do
      decision.conditions.should == [[0], [1]]
    end

    it "'[0]' evaluates to '0'" do
      decision.evaluate([0]).should == 0
    end

    it "'[1]' evaluates to '1'" do
      decision.evaluate([1]).should == 1
    end

    it "creates 2 test cases" do
      case1 = mock('case1')
      case2 = mock('case2')
      
      TestCase.should_receive(:new).with(1, [0], 0).and_return(case1)
      TestCase.should_receive(:new).with(2, [1], 1).and_return(case2)

      decision.test_cases.should include case1
    end

  end

  describe "parsing 'A or B'" do

    let(:decision) { parser.parse('A or B') }
    
    it "condition identifiers are ['A','B']" do
      decision.condition_identifiers.should == ['A','B']
    end

    it "conditions is [[0,0],[0,1],[1,0],[1,1]]" do
      decision.conditions.should == [[0,0],[0,1],[1,0],[1,1]]
    end

    it "'[0, 0]' evaluates to '0'" do
      decision.evaluate([0, 0]).should == 0
    end

    it "'[0, 1]' evaluates to '1'" do
      decision.evaluate([0, 1]).should == 1
    end

    it "'[1, 0]' evaluates to '1'" do
      decision.evaluate([1, 0]).should == 1
    end

    it "'[1, 1]' evaluates to '1'" do
      decision.evaluate([1, 1]).should == 1
    end

  end

  describe "parsing 'A and B'" do

    let(:decision) { parser.parse('A and B') }
    
    it "conditions are ['A','B']" do
      decision.condition_identifiers.should == ['A','B']
    end

    it "conditions is [[0,0],[0,1],[1,0],[1,1]]" do
      decision.conditions.should == [[0,0],[0,1],[1,0],[1,1]]
    end

    it "'[0, 0]' evaluates to '0'" do
      decision.evaluate([0, 0]).should == 0
    end

    it "'[0, 1]' evaluates to '0'" do
      decision.evaluate([0, 1]).should == 0
    end

    it "'[1, 0]' evaluates to '0'" do
      decision.evaluate([1, 0]).should == 0
    end

    it "'[1, 1]' evaluates to '1'" do
      decision.evaluate([1, 1]).should == 1
    end

  end

end
