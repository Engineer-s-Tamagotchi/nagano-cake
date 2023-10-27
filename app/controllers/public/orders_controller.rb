class Public::OrdersController < ApplicationController

  before_action :access_limit, only: [:show]

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order_payment_method = params[:order][:payment_method].to_i
    @order_postage = 800
    @total_price = 0
    selected_address = params[:order][:selected_address].to_i
    if selected_address == 0
      @order_postal_code = current_customer.postal_code
      @order_address = current_customer.address
      @order_name = current_customer.last_name + current_customer.first_name
    elsif selected_address == 1
      if Address.exists?(id: params[:order][:address_id])
        address = Address.find(params[:order][:address_id])
        @order_postal_code = address.postal_code
        @order_address = address.address
        @order_name = address.name
      else
        render :new
      end
    elsif selected_address == 2
      @order_postal_code = params[:order][:postal_code]
      @order_address = params[:order][:address]
      @order_name = params[:order][:name]
    else
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
      if @order.save
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @cart_items.each do |cart_item|
          order_detail = OrderDetail.new
          order_detail.order_id = @order.id
          order_detail.item_id = cart_item.item_id
          order_detail.amount = cart_item.amount
          order_detail.including_tax_price = cart_item.item.including_tax_price
          if order_detail.save
            @cart_items.destroy_all
          end
        end
        redirect_to complete_orders_path
      else
        render :new
      end
  end

  def complete
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).page(params[:page]).per(5)
  end

  def show
    @order = Order.find(params[:id])
  end

end

private

  def order_params
    params.require(:order).permit(:name, :billing_price, :payment_method, :postage, :postal_code, :address)
  end

  def access_limit
    order = Order.find(params[:id])
    unless order.customer_id == current_customer.id
      redirect_to orders_path
    end
  end
