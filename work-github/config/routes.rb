Rails.application.routes.draw do



  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}




  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


scope module: :public do
  resources :customers, only: [:update]
  patch 'customers/change' => 'customers#change'
  get 'customers/information/edit' => 'customers#edit', as: "customers_edit"
  get 'customers/withdrawal' => 'customers#withdrawal'
  
  get 'homes/top'
  get 'homes/about'
  get 'customers/my_page' => 'customers#my_page'
  post 'deliveries' => 'deliveries#create'
  get 'deliveries/index'
  get 'deliveries/edit'
 
end

 namespace :admin do
  get 'homes/top'
  resources :customers, only: [:edit, :update]
  get 'customers/my_page' => 'customers#my_page'
end






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
