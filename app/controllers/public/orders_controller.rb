class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order_payment_method = params[:order][:payment_method]
    if params[:selected_address] == 0
      @order_postal_code = current_customer.postal_code
      @order_address = current_customer.address
      @order_name = current_customer.last_name + current_customer.first_name
    elsif params[:selected_address] == 1
      if Address.exists?(id: params[:order][:address_id])
        address = params[:order][:address_id]
        @order_postal_code = address.postal_code
        @order_address = address.address
        @order_name = address.name
      else
        render :new
      end
    else
      @order_postal_code = params[:order][:postal_code]
      @order_address = params[:order][:address]
      @order_name = params[:order][:name]
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