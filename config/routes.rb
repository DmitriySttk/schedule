Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    resources :activities do
      resources :registrations
    end

    resources :users

    root 'home#index'
    get 'home/search'
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
