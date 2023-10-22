class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(3)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "登録情報の変更が完了しました."
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_furigana, :first_name_furigana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end
