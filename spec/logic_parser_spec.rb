require 'rubygems'
require 'treetop'
require 'logic_parser'
require 'logic_operations'

describe LogicParser, :parsing do
  let(:parser) { LogicParser.new }

  describe "a single condition" do
    it "identifies the condition" do
      decision = parser.parse('Hello')
      expect(decision.condition_identifiers).to eq ['Hello']
    end

    it 'allows underscores in the condition' do
      decision = parser.parse('a_name')
      expect(decision.condition_identifiers).to eq ['a_name']
    end
  end

  describe "'A or B'" do
    it "condition identifiers are ['A','B']" do
      decision = parser.parse('A or B')
      expect(decision.condition_identifiers).to eq ['A','B']
    end
  end

  describe "'A or B or C'" do
    it "condition identifiers are ['A','B','C']" do
      decision = parser.parse('A or B or C')
      expect(decision.condition_identifiers).to eq ['A','B','C']
    end
  end

  describe "'A and B'" do
    it "conditions are ['A','B']" do
      decision = parser.parse('A and B')
      expect(decision.condition_identifiers).to eq ['A','B']
    end
  end

  describe "'A and B and C'" do
    it "condition identifiers are ['A','B','C']" do
      decision = parser.parse('A and B and C')
      expect(decision.condition_identifiers).to eq ['A','B','C']
    end
  end

  { 'condition' =>
    { [0] => 0,
      [1] => 1
    },
    '(condition)' =>
    { [0] => 0,
      [1] => 1
    },
    'not negated' =>
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
    'A and not B' =>
    { [1, 1] => 0,
      [0, 1] => 0,
      [1, 0] => 1
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
    },
    '( A and (B or C) )' =>
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
          expect(decision.evaluate(conditions)).to eq result
        end
      end
    end
  end
end
