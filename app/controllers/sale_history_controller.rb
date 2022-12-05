class SaleHistoryController < ApplicationController
  def index
    @myItem = Inventory.where(user_id: session[:user_id]).all
  end
end
