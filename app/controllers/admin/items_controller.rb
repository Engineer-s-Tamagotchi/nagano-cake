class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:excluding_tax_price,:is_on_sale)
  end

end
