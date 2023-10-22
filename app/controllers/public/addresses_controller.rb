class Public::AddressesController < ApplicationController
  
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
      flash[:success] = "Delivery destination registration completed"
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses
      flash[:danger] = "There is a problem with the shipping address"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = "Your shipping address changes have been saved"
      redirect_to addresses_path
    else
      flash[:danger] = "I have a problem changing the shipping address"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.destroy
    flash[:success] = "Delivery destination successfully released"
    redirect_to addresses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
    
  
end
