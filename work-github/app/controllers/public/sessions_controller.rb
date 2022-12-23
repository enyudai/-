# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  #devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #退会フラグステータス関連
  before_action :customer_state, only: [:create]
  
  
  def after_sign_in_path_for(resource)
    customers_my_page_path
  end
  
  def after_sign_out_path_for(resource)
    customer_session_path
  end
  
  #privateは記述をしたコントローラ内でしか参照できない
  #protectedは呼び出された他のコントローラからも参照することができる
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end
  
  # 退会しているかを判断するメソッド
  def customer_state
      
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && !@customer.withdrawal_flag
    else
      #flash[:notice] = "既に退会されています。再度ご登録を行ってください。"
      redirect_to "/customers/sign_up"
    end
  end
end