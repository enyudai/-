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
  
  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(withdrawal_flag: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to homes_about_path
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
