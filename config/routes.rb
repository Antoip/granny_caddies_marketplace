Rails.application.routes.draw do
  root to: 'caddies#index'
  devise_for :users

  resources :caddies do
    resources :bookings, only: %i[new create] do
    end
  end
  patch "/caddies/:id/availability", to: "caddies#update_availability"

  resources :bookings, only: :show do
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: :destroy

  resources :notifications, only: %i[update delete]
  get "/notifications", to: "pages#notifications"
  patch "/notifications/:id/read_status", to: "notifications#update_read_status"

  get "/dashboard", to: "pages#dashboard"

  resources :users, only: [] do
    resources :messages, only: [:index, :create]
  end
  get 'conversations', to: 'messages#conversations'
end
