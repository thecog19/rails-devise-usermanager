Rails.application.routes.draw do
  devise_for :users, except: :create
  post 'create_user' => 'users#create', as: :create_user  

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end
  devise_scope :user do
  	root to: "devise/sessions#new"
  end


  get 'view', to: 'home#view'
  get 'users/new', to: 'users#new'
  get 'users/index', to: 'users#index'
  get 'users/edit/:id', to: 'users#edit', as: :users_edit
  patch 'users/update/:id', to: 'users#update', as: :update_user
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
end
