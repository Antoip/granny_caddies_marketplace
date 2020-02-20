Rails.application.routes.draw do
  root to: 'caddies#index'
  devise_for :users

  # resources :users, only: %i[show new create edit update delete]

  resources :caddies do
    resources :bookings, only: %i[new create] do
    end
  end

  resources :bookings, only: :show do
    resources :reviews, only: %i[new create]
  end

  resources :notifications, only: %i[create update delete]

  get "/dashboard", to: "pages#dashboard"
  get "/notifications", to: "pages#notifications"
  resources :bookings, only: :destroy
  patch "/caddies/:id/availability", to: "caddies#update_availability"
  get 'conversations', to: 'messages#conversations'

  resources :users, only: [] do
    resources :messages, only: [:index, :create, :update]
  end

end
