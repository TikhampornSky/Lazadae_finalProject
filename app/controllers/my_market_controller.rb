class MyMarketController < ApplicationController
  # before_action :must_be_logged_in

  def index
    @user_id = session[:user_id]
    @myItem = Item.all
  end

  def buy
    @want_to_buy = params[:buying].to_i
    @item_id = params[:item_id]
    @market = Market.where(item_id: @item_id).first
    @current_stock = @market.stock
    if (@want_to_buy > @current_stock)
      redirect_to '/my_market', notice: "คำสั่งซื้อไม่สำเร็จ เนื่องจากจำนวนสินค้าที่คงเหลือไม่พอ"
    else
      @market.stock = @current_stock - @want_to_buy
      @market.save

      @inventory = Inventory.new
      @inventory.user_id = session[:user_id]
      @inventory.seller_id = @market.user_id
      @inventory.price = @market.price * @want_to_buy
      @inventory.qty = @want_to_buy
      @inventory.save

      redirect_to '/my_market', notice: "Completly buying ;)"
    end
  end
end
