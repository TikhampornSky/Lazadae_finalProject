class MyMarketController < ApplicationController
  # before_action :must_be_logged_in

  def index
    @user_id = session[:user_id]
    @myItem = Item.all
    # respond_to do |format|
    #   format.html
    #   format.json { render json: MyMarketDatatable.new(params) }
    # end
  end
end
