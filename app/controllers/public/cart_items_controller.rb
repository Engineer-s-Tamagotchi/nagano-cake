class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      render :items#show
    end
  end

  def index
    @cart_items = CartItem.all
    @billing_price = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    if CartItem.destroy_all
      redirect_to items_path
    else
      render :index
    end

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id,:item_id,:amount)
  end

end
