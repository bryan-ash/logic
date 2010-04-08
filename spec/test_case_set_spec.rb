require 'test_case_set'

describe TestCaseSet do

  describe "with 1 condition" do

    let(:test_case_set) { TestCaseSet.new(1, nil) }
    
    describe :condition_dentifiers do
      
      it "includes 'a'" do
        test_case_set.condition_identifiers.should include('a')
      end

    end
    
    it "has 2 test cases" do
      test_case_set.count.should == 2
    end

  end
  
end
