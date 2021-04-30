require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup"  do
      
    get singup_path
    assert_no_difference 'User.count' do
      post users_path,user:{name:"",email:"user@invalid",password:"pass",password_confirmation:"pass"}
    end
    assert_template 'users/new'
  end

end
