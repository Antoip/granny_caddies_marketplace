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

  resources :notifications, only: %i[update delete]

  get "/dashboard", to: "pages#dashboard"
  get "/notifications", to: "pages#notifications"
  resources :bookings, only: :destroy
  patch "/caddies/:id/availability", to: "caddies#update_availability"
  patch "/notifications/:id/read_status", to: "notifications#update_read_status"
  get 'conversations', to: 'messages#conversations'
  resources :users, only: [] do
    resources :messages, only: [:index, :create]
  end
end
