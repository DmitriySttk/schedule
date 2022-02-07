Rails.application.routes.draw do

  resources :activities do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
