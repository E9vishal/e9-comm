require 'test_helper'

class E9SpreeConnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get e9_spree_connections_new_url
    assert_response :success
  end

end
