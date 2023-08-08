Rails.application.routes.draw do
  root "rooms#index"

  devise_for :users, controllers: {registrations: 'users/registrations'}

  get 'users/show'
  get "users/show" => "user#show"

  resources :rooms
  
  resources :room do
    resources :reservations
  end
  
  resources :reservations, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
