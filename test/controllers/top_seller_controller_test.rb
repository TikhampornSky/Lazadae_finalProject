require "test_helper"

class TopSellerControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    get '/top_seller'
    assert_response :success
  end
end
