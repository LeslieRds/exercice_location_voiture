Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cars do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]
end
