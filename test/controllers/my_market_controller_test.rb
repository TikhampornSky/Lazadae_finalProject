require "test_helper"

class MyMarketControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    get '/my_market'
    assert_response :success
  end

  test "buy without specific number" do
    get '/my_market'
    assert_no_difference("Market.find("+"#{items(:one).id}"+").stock") do
      get '/my_market/buy', params: { item_id: "#{items(:one).id}", buying: '' }
    end
  end 

  test "buy case 1 (enough stock)" do
    get '/my_market'
    assert_difference("Market.find("+"#{items(:one).id}"+").stock", -1) do
      get '/my_market/buy', params: { item_id: "#{items(:one).id}", buying: 1 }
    end
  end 

  test "buy case 2 (not enough stock)" do
    get '/my_market'
    assert_no_difference("Market.find("+"#{items(:one).id}"+").stock") do
      get '/my_market/buy', params: { item_id: "#{items(:one).id}", buying: 10000 }
    end
  end

end
