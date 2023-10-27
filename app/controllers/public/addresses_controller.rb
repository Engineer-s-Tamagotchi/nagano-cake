class Public::AddressesController < ApplicationController

  before_action :access_limit, only: [:edit]

  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

  def access_limit
    address = Address.find(params[:id])
    unless address.customer_id == current_customer.id
      redirect_to addresses_path
    end
  end

end
