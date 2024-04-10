require "test_helper"

class Public::PastRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_past_records_show_url
    assert_response :success
  end

  test "should get index" do
    get public_past_records_index_url
    assert_response :success
  end
end
