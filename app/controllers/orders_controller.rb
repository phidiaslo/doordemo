class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  before_filter :check_user, only: [:show]


  def sales
    if merchant_signed_in?
      @orders = Order.all.where(merchant: current_merchant).order("created_at DESC")
    else
      redirect_to new_merchant_session_path, alert: "The page that you're trying to access is for merchants only."
    end
  end

  def purchases
    if user_signed_in?
      @orders = Order.all.where(user: current_user).order("created_at DESC")
    else
      redirect_to new_user_session_path, alert: "The page that you're trying to access is for members only."
    end
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order("created_at DESC")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @line_items = LineItem.where(:order_id => params[:id])
  end

  # GET /orders/new
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to :back, notice: "Your cart is empty"
      return
    end
 
    @order = Order.new
    @merchant = Merchant.find(params[:merchant_id]) #Trial 1
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    @order.user_id = current_user.id
    @merchant = Merchant.find(params[:merchant_id]) #Trial 1
    @order.merchant_id = @merchant.id #Success!
    @order.cart_id = current_cart.id
       

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        session[:order_id] = @order.id
        format.html { redirect_to root_path, notice: 'Thank you for your order.' }
        format.json { render :show, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id]) #trial
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:delivery_date, :delivery_time, :address, :pay_type)
    end

    def check_user

      if user_signed_in?
        if current_user != @order.user
          redirect_to root_url, alert: "Sorry, this page belongs to someone else"
        end
      else merchant_signed_in?
        if current_merchant != @order.merchant
          redirect_to root_url, alert: "Sorry, this page belongs to someone else"
        end
      end

    end

end
