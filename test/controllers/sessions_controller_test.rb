require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get sessions_welcome_url
    assert_response :success
  end

  test "should get sign_in" do
    get sessions_sign_in_url
    assert_response :success
  end

  test "should get sign_out" do
    get sessions_sign_out_url
    assert_response :success
  end
end
