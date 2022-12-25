class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.all
  end
  
  def show
    @orders = Order.all
    @customer = Customer.find(params[:id])
  end
  
  def edit 
    @orders = Order.find(params[:id])
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path, notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :withdrawal_flag)
  end
end
