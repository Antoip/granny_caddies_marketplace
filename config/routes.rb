Rails.application.routes.draw do
<<<<<<< HEAD
  get 'caddies/index'
  get 'caddies/show'
  get 'caddies/new'
  get 'caddies/edit'
=======
  get 'bookings/new'
  get 'reviews/new'
>>>>>>> 49fb8f0e0ceaf06cae571a842890bad59f6af78e
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
