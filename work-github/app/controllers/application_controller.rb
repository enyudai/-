class ApplicationController < ActionController::Base
  #devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  #privateは記述をしたコントローラ内でしか参照できない
  #protectedは呼び出された他のコントローラからも参照することができる
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
