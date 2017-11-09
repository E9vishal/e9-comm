require 'test_helper'

class SpreeConnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spree_connections_new_url
    assert_response :success
  end

end
