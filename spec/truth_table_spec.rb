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

      it "has 2 cases" do
        table.cases.length.should == 2
      end

    end

  end
  
end
