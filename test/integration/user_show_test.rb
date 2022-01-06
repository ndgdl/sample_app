require "test_helper"

class UserShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @non_activated_user = users(:krieger)
  end

  test "the show page of an unactivated user should redirect to homepage" do
    log_in_as(@user)
    get user_path(@non_activated_user)
    follow_redirect!
    assert_template 'static_pages/home'
  end
end
