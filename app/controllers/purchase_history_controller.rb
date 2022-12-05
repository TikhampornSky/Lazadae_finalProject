class PurchaseHistoryController < ApplicationController
  before_action :must_be_logged_in
  before_action :role, :authorization
  def authorization
    if (@myrole == 'admin' || @myrole == 'buyer')
    
    else
      redirect_to '/permission'
    end
  end
  
  def index
    @myItem = Inventory.where(user_id: session[:user_id]).all
  end
end
