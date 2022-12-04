require "test_helper"

class MyMarketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_market_index_url
    assert_response :success
  end
end
