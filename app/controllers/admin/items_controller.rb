class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    if params[:item][:is_on_sale] == "true"
      params[:item][:is_on_sale] = true
    else
      params[:item][:is_on_sale] = false
    end
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if params[:item][:is_on_sale] == "true"
      params[:item][:is_on_sale] = true
    else
      params[:item][:is_on_sale] = false
    end

    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:genre_id,:excluding_tax_price,:is_on_sale)
  end

end