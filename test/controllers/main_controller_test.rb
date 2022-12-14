require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    get "/main"
    assert_response :success
  end

  def admin_login
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  def seller_login
    @email = '1@gmail.com'
    @password = "1"
    get '/login/create', params: { email: @email, password: @password }
  end

  def buyer_login
    @email = '2@gmail.com'
    @password = "2"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "reach /proflie" do
    admin_login()
    get '/profile'
    assert_response :success

    seller_login()
    get '/profile'
    assert_response :success

    buyer_login()
    get '/profile'
    assert_response :success
  end

  test "reach /my_market" do
    admin_login()
    get '/my_market'
    assert_response :success

    seller_login()
    get '/my_market'
    assert_redirected_to "/permission"

    buyer_login()
    get '/my_market'
    assert_response :success
  end

  test "reach /purchase_history" do
    admin_login()
    get '/purchase_history'
    assert_response :success

    seller_login()
    get '/purchase_history'
    assert_redirected_to "/permission"

    buyer_login()
    get '/purchase_history'
    assert_response :success
  end

  test "reach /sale_history" do
    admin_login()
    get '/sale_history'
    assert_response :success

    seller_login()
    get '/sale_history'
    assert_response :success

    buyer_login()
    get '/sale_history'
    assert_redirected_to "/permission"
  end

  test "reach /my_inventory" do
    admin_login()
    get '/my_inventory'
    assert_response :success

    seller_login()
    get '/my_inventory'
    assert_response :success

    buyer_login()
    get '/my_inventory'
    assert_redirected_to "/permission"
  end

  test "reach /top_seller" do
    admin_login()
    get '/top_seller'
    assert_response :success

    seller_login()
    get '/top_seller'
    assert_response :success

    buyer_login()
    get '/top_seller'
    assert_redirected_to "/permission"
  end

end
