Rails.application.routes.draw do

  get 'bookings/new'
  get 'reviews/new'
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

  get "/dashboard", to: "pages#dashboard"
  resources :bookings, only: :delete
end
