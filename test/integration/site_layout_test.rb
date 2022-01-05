require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path

    get help_path
    assert_select "title", full_title("Help")
    get about_path
    assert_select "title", full_title("About")
    get contact_path
    assert_select "title", full_title("Contact")
    get help_path
    assert_select "title", full_title("Help")
    get signup_path
    assert_select "title", full_title("Sign up")

    log_in_as(@user)
    get users_path(@user)
    assert_select "title", full_title("All users")
    get user_path(@user)
    assert_select "title", full_title(@user.name)
    get edit_user_path(@user)
    assert_select "title", full_title("Edit user")
    delete logout_path
    assert_redirected_to root_path

  end
end
