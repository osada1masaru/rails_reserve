Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
    }

  devise_scope :user do
    get "/users/sign_up" => "devise/registrations#new"
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :users
  resources :reservations, only: [:create]
  resources :rooms

  root "rooms#index"

  # get "sessions/new"
  # get "/" => "romm#index"
  # get "login" => "sessions#new"
  # post "login" => "sessions#create"
  # delete "logout" => "sessions#delete"
  # get 'users/show'
  # get "users/show" => "user#show"
  # resources :room do
    # resources :reservations
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
