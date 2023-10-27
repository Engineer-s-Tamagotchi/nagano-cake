class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:order_id])
    order_detail.production_status = params[:order_detail][:production_status]
    order_details = OrderDetail.where(order_id: order_detail.order_id)
    if order_detail.production_status == "in_production"
      order_detail.order.update(status: 2)
    end
    if order_detail.update(order_detail_params)
      redirect_to admin_order_path
    end
    if order_details.all? { |detail| detail.production_status == "production_complete" }
      order_detail.order.update(status: 3)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
