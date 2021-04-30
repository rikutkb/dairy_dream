require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @user = User.new(name:"test_user",email:"test@test.com",password:"aaaaa")
  end
  test "should be valid" do
    assert @user.valid?
  end
  test "name should be present and more than 4" do
    @user.name =""
    assert_not @user.valid?
    @user.name="aaa"
    assert_not @user.valid?
  end
  test "same name should not be registerd" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
    dup_user.name ="test_user2"
    dup_user.email="test2@test.com"
    assert dup_user.valid?
  end
  test "password should be more than 5 and less than 50" do
    @user.password="aaaa"
    assert_not @user.valid?
    @user.password="a"*51
    assert_not @user.valid?
  end
end
