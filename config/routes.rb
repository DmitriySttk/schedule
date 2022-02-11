Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :activities do
    resources :registrations
  end

  resources :users

  root 'home#index'
  get 'home/search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
