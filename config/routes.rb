Rails.application.routes.draw do
  root "rooms#index"

  get "sessions/new"
  get "/" => "romm#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#delete"

  devise_for :users, controllers: {registrations: 'users/registrations'}

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get 'users/show'
  get "users/show" => "user#show"

  resources :rooms
  resources :users
  
  resources :room do
    resources :reservations
  end
  
  resources :reservations, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
