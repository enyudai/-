Rails.application.routes.draw do
 
  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations] ,controllers: {
  sessions: "admin/sessions"
}
# 会員用
# URL /users/sign_in ...
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
    
    root to: 'homes#about'
    get 'homes/top' => 'homes#top'
   
   resources :users, only: [:show, :index, :edit, :update]
   
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
