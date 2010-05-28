require 'rubygems'
require 'treetop'
require 'logic_parser'
require 'logic_operations'

describe LogicParser, :parsing do

  let(:parser) { LogicParser.new }

  describe "a single condition" do
    it "identifies the condition" do
      decision = parser.parse('Hello')
      decision.condition_identifiers.should == ['Hello']
    end
  end

  describe "'A or B'" do
    it "condition identifiers are ['A','B']" do
      decision = parser.parse('A or B')
      decision.condition_identifiers.should == ['A','B']
    end
  end

  describe "'A or B or C'" do
    it "condition identifiers are ['A','B','C']" do
      decision = parser.parse('A or B or C')
      decision.condition_identifiers.should == ['A','B','C']
    end
  end

  describe "'A and B'" do
    it "conditions are ['A','B']" do
      decision = parser.parse('A and B')
      decision.condition_identifiers.should == ['A','B']
    end
  end

  describe "'A and B and C'" do
    it "condition identifiers are ['A','B','C']" do
      decision = parser.parse('A and B and C')
      decision.condition_identifiers.should == ['A','B','C']
    end
  end

  { 'Hello' =>
    { [0] => 0,
      [1] => 1
    },
    '(Hello)' =>
    { [0] => 0,
      [1] => 1
    },
    'not Hello' =>
    { [0] => 1,
      [1] => 0
    },
    'A or B' =>
    { [0, 0] => 0,
      [0, 1] => 1,
      [1, 0] => 1
    },
    'A xor B' =>
    { [0, 0] => 0,
      [0, 1] => 1,
      [1, 0] => 1,
      [1, 1] => 0
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
    describe "'#{logic}'" do

      cases.each do |conditions, result|
        it "'#{conditions}' evaluates to '#{result}'" do
          decision = parser.parse(logic)
          decision.evaluate(conditions).should == result
        end
      end
    end

  end

end
