class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_status = @order.status
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    order = Order.find(params[:id])
    order.status = params[:order][:status].to_i
    if order.update(order_params)
      redirect_to admin_order_path(order)
    else
      
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :billing_price, :payment_method, :posal_code, :addrss, :status)
  end

end
