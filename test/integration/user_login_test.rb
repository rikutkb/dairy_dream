require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'login with invalid pass' do
    get login_path
    assert_template 'sessions/new'
    post login_path,params:{session:{name:"",password:""}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    #assert flash.empty?
  end
end
