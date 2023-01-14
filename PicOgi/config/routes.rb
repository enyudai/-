Rails.application.routes.draw do
 
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations] ,controllers: {
    sessions: "admin/sessions"
  }

  # # 会員用
  # # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  devise_scope :user do
    get '/users/sign_out' => 'public/sessions#destroy'
  end
  
  

  scope module: :public do
      root to: 'homes#about'
      get 'homes/top' => 'homes#top'
      
      
     
     resources :users, only: [:show, :edit, :update]
     
     post 'subjects/check' => 'subjects#check'
     resources :subjects, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
       resources :answers, only: [:create, :destroy] do
         resource :favorites, only: [:create, :destroy]
       end
     end
  end

 namespace :admin do
  get 'homes/top' => 'homes#top'
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
