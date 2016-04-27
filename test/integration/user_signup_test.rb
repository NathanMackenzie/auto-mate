require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
      get signup_path
      assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password",
                                            remember_me: "0" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {username: " ", 
                              email: "invalid", 
                              password: "foo", 
                              password_confirm: "bar",
                              remember_me: "0"}
      assert_template 'users/new'
    end
  end
end
