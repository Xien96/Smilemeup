require 'test_helper'

class ClearupControllerTest < ActionDispatch::IntegrationTest
  test "should get candidate" do
    get clearup_candidate_url
    assert_response :success
  end

end
