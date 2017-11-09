require 'test_helper'

class E9ConnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get e9_connections_new_url
    assert_response :success
  end

end
