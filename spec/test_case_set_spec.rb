require 'test_case_set'

describe TestCaseSet do
  describe "with 1 condition" do
    it "input_dentifiers includes 'a'" do
      test_case_set = TestCaseSet.new(['hello'], nil)
      expect(test_case_set.input_identifiers).to include('a')
    end
  end
end
