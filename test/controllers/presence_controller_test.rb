require 'test_helper'

class PresenceControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

end
