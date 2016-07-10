require 'test_helper'

class SubmissionsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get submissions_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get submissions_controller_create_url
    assert_response :success
  end

end
