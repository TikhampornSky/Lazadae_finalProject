class PurchaseHistoryController < ApplicationController
  before_action :must_be_logged_in
  def index
    @myItem = Inventory.where(user_id: session[:user_id]).all
  end
end
