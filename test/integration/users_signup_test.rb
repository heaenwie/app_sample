require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                  email: "user@invalid",
                                  password:              "foo",
                                  password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div.field_with_errors'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
    assert_select 'div#error_explanation'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                  email: "user@valid.com",
                                  password:              "foobar",
                                  password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_select 'div.alert-success'
    assert is_logged_in?
    # assert_not 'flash.alert-danger' <-- nie działa, sprawdzić czemu!
    #assert_not 'div.field_with_errors'
  end
end

# test "the truth" do
  #   assert true
  # end