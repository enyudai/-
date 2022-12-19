class Public::CustomersController < ApplicationController
  
  
  def my_page
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path(@customer.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def change
    
  end
  
  private

  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number)
  end
  
  def change_customer
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
