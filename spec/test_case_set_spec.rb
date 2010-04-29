require 'test_case_set'

describe TestCaseSet do

  describe "with 1 condition" do
    
    it "input_dentifiers includes 'a'" do
      test_case_set = TestCaseSet.new(['hello'], nil)
      test_case_set.input_identifiers.should include('a')
    end
    
  end
  
end
