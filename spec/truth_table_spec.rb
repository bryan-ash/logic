require 'truth_table'

describe TruthTable do

  describe "with 1 condition" do

    let(:table) { TruthTable.new(1) }
    
    describe :condition_dentifiers do
      
      it "includes 'a'" do
        table.condition_identifiers.should include('a')
      end

    end

    describe :cases do

      it "includes [0]" do
        table.cases.should include([0])
      end

      it "includes [1]" do
        table.cases.should include([1])
      end

    end

  end
  
end
