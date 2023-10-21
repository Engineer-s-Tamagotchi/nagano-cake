class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(current_customer)
  end
  
  def edit
    @customer = Customer.find(current_customer)
  end
  
  def update
    @customer = Customer.find(current_customer)
    if @customer.update(customer_params)
      redirect_to mypage_customers_path(current_customer)
    else
      render :edit
    end
  end
  
  def unsubscribe
    
  end
  
  def quit
    
  end
  
end
