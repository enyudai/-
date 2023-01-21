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
    get '/admin/sign_out' => 'admin/sessions#destroy'
  end
  
  devise_scope :user do
    post '/users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    get '/users/sign_out' => 'public/sessions#destroy'
  end
  
  

  scope module: :public do
      root to: 'homes#about'
      get 'homes/top' => 'homes#top'
      
      patch 'users/change' => 'users#change', as: 'change'
      
      get 'users/is_deleted' => 'users#is_deleted'
      
      get "search" => "searches#index"
      
      resources :reports, only: [:new, :create, :index]
      
      resources :users, only: [:show, :edit, :update] do
       member do
        get :favorites
       end
     end
     
     post 'subjects/check' => 'subjects#check'
     resources :subjects, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    
       resources :answers, only: [:create, :destroy] do
        #  resources :reports, only: [:new, :create]
         resource :favorites, only: [:create, :destroy]
       end
     end
     
  end

 namespace :admin do
  get 'homes/top' => 'homes#top'
  
  resources :subjects,  only: [:show, :destroy] do
   resources :answers, only: [:destroy]
  end 
  
  resources :users, only: [:index, :show, :update, :edit]
  
  resources :reports, only: [:index, :show, :update, :edit]
  
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
