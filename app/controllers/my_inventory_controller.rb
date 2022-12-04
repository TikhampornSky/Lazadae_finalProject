class MyInventoryController < ApplicationController
  def index
    @user_id = session[:user_id]          
    @myItem = Market.where(user_id: @user_id).all
    @user_type = User.find(@user_id).user_type
    session[:previous_page] = '/my_inventory'
  end

  def destroy_item 
    @item = Item.find(params[:id])
    Market.destroy_by(item_id: params[:id])
    @item.destroy

    redirect_to '/my_inventory', notice: 'Delete succesfully!!!'
  end

  def create
  end

  def newItem
    @name = params[:name]
    @category = params[:category]
    @price = params[:price]
    @stock = params[:stock]

    @item = Item.new
    @item.name = @name
    @item.category = @category
    @item.enable = false
    @item.save

    @market = Market.new
    @market.user_id = session[:user_id]
    @market.item_id = @item.id
    @market.price = @price
    @market.stock = @stock
    @market.save

    redirect_to '/my_inventory', notice: 'Adding new item succesfully!!!'

  end

end
