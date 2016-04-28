require 'test_helper'

class FacebookTest < ActiveSupport::TestCase
  def setup
    @facebook = Facebook.create(email: 'user@example.com', password: "foobar")
  end
  
  test "should be valid" do
    assert @facebook.valid?
  end

  test "email should be present" do
    @facebook.email = "      "
    assert_not @facebook.valid?
  end
  
  test "email should have max length" do
    @facebook.email = "a"*244 + "@example.com"
    assert_not @facebook.valid?
  end
  
  test "email validation should except valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                            first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @facebook.email = address
      assert @facebook.valid?, "#{address} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                              foo@bar_baz.com foo@bar+baz.com]
                              
    invalid_addresses.each do |address|
      @facebook.email = address
      assert_not @facebook.valid?, "#{address} should be invalid"
    end
  end
  
  test "password should be present" do
    @facebook.password = " "*6
    assert_not @facebook.valid?
  end
  
  test "password should have minimum length" do
    @facebook.password = "a"*5
    assert_not @facebook.valid?
  end
  
  test "password should have max length" do
    @facebook.password = "a"*51
    assert_not @facebook.valid?
  end
end
