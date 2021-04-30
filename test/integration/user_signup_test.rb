require 'test_helper'
class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "valid signup"  do
      
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params:{user: {name:"rikua",email:"user@invalid",password:"password",password_confirmation:"password"}}
    end
    # assert_template 'users/show'
    # assert logged_in?
  end

end
