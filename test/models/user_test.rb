require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'Example User', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = "      "
    assert_not @user.valid?
  end
  
  test "username should have max length" do
    @user.username = "a"*51
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "      "
    assert_not @user.valid?
  end
  
  test "email should have max length" do
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email validation should except valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                            first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @email = address
      assert @user.valid?, "#{address} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                              foo@bar_baz.com foo@bar+baz.com]
                              
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address} should be invalid"
    end
  end
  
  test "password should be present" do
    @user.password = " "*6
    assert_not @user.valid?
  end
  
  test "password should have minimum length" do
    @user.password = "a"*5
    assert_not @user.valid?
  end
  
  test "password should have max length" do
    @user.password = "a"*50
    assert_not @user.valid?
  end
end
