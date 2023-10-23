class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @payment_method = params[:order][:payment_method]
    if params[:selected_address] == 0
      @postal_code = current_customer.postal_code
      @address = current_customer.address
      @name = current_customer.last_name + current_customer.first_name
    elsif params[:selected_address] == 1
      address_id = params[:order][:address_id]
      @address = Address.find_by(id: address_id)
      @postal_code = @address.postal_code
    end
  end

  def complete

  end

  def create

  end

  def index

  end

  def show

  end

end

private
  
  def order_params
    params.require(:order).permit(:name, :billing_price, :payment_method, :postage, :postal_code, :address, :status)
  end