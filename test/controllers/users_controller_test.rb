require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should redirect to home when user not found' do
    get user_url(User.maximum(:id) + 1)
    assert_redirected_to home_path
  end
end
