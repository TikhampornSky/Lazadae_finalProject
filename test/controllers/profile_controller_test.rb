require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end
  
  test "should get index" do
    get '/profile'
    assert_response :success
  end
end
