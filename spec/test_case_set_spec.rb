require 'test_case_set'

describe TestCaseSet do

  describe "with 1 condition" do

    let(:test_case_set) { TestCaseSet.new(1, nil) }
    
    it "input_dentifiers includes 'a'" do
      test_case_set.input_identifiers.should include('a')
    end
    
    it "has 2 test cases" do
      test_case_set.count.should == 2
    end

  end
  
end
