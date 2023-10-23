class Public::CartItemsController < ApplicationController
  def create
    item_id = params[:item_id]
    existing_cart_item = current_customer.cart_items.find_by(item_id: item_id)
    
    if existing_cart_item
      amount = params[:amount].to_i
      existing_cart_item.update(amount: existing_cart_item.amount + amount)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    
      redirect_to cart_items_path
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
