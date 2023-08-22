Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/new'
  get 'reservations/show'

  get 'rooms/index'
  get 'rooms/new'

  get 'users/profile'
  get 'users/update'
  get 'users/login'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
    }

  devise_scope :user do
    get "/users/sign_up" => "devise/registrations#new"
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  root "rooms#index"

  resources :rooms do
    collection do
      get 'search'
    end
  end
  
  resources :reservations

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
