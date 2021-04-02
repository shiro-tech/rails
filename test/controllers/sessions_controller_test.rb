require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get neew" do
    get sessions_neew_url
    assert_response :success
  end

end
