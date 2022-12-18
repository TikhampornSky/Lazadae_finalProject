class ItemsController < ApplicationController
  before_action :must_be_logged_in
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :role
  before_action :authorization, only: %i[ index ]
  # before_action :authorization, except: [:edit, :show]

  def authorization
    if (@myrole == 'admin')
    
    else
      redirect_to '/permission'
    end
  end

  def newItem
  end

  def mynew
    # @name = params[:name]
    # @category = params[:category]
    # @price = params[:price]
    # @stock = params[:stock]

    # @item = Item.new
    # @item.name = @name
    # @item.category = @category
    # @item.enable = false
    # @item.picture.attach(params[:picture])      
    # @item.save

    # @market = Market.new
    # @market.user_id = session[:user_id]
    # @market.item_id = @item.id
    # @market.price = @price
    # @market.stock = @stock
    # @market.save

    # redirect_to '/my_inventory', notice: 'Adding new item succesfully!!!'
  end

  # GET /items or /items.json
  def index
    @items = Item.all
    session[:previous_page] = '/items'
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @editing = false
    if (@myrole == 'buyer')
      redirect_to '/permission'
    end
  end

  # GET /items/1/edit
  def edit
    @editing = true
    @belong_user_id = Market.where(item_id: params[:id]).first.user_id
    if (@myrole != 'admin' && @belong_user_id != session[:user_id])
      redirect_to '/permission'
    end
  end

  # POST /items or /items.json
  def create
    if (@myrole == 'buyer')
      redirect_to '/permission'
    end
    @editing = false
    @item = Item.new(item_params)

    @user_id = session[:user_id]
    @price = market_params[:price]
    @stock = market_params[:stock]

    respond_to do |format|
      if @item.save

        @market = Market.new
        @market.user_id = session[:user_id]
        @market.item_id = @item.id
        @market.price = @price
        @market.stock = @stock
        @market.save

        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    if (@myrole == 'buyer')
      redirect_to '/permission'
    end
    respond_to do |format|
      if @item.update(item_params)
        if (item_params[:picture] != nil)
          @item.picture.attach(item_params[:picture])      #Update Image
        end
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    if (@myrole == 'buyer')
      redirect_to '/permission'
    end
    Inventory.where(item_id: @item.id).destroy_all
    Market.where(item_id: @item.id).destroy_all
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :category, :enable, :lock_version, :picture)
    end

    def market_params
      params.require(:item).permit(:price, :stock)
    end
end
