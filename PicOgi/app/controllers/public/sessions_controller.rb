# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

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
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to homes_top_path, notice: 'guestuserでログインしました。'
  end
  
  private
  
  def after_sign_in_path_for(resource)
    homes_top_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :nickname, :introduction])
  end
  
  # 退会しているかを判断するメソッド
  def user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if @user.nil?
    
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted
      flash[:notice] = "既に退会されています。再度ご登録を行ってください。"
      redirect_to "/users/sign_up"
    end
  end
 
end
