Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :products, only: [:index]
  resources :categories, only: [:index]
  resources :brands, only: [:index]

  resources :users, only: [:create, :show] do
    post "/login", action: :login, on: :collection
  end
end
