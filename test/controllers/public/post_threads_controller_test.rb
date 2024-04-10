require "test_helper"

class Public::PostThreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_post_threads_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_threads_edit_url
    assert_response :success
  end
end
