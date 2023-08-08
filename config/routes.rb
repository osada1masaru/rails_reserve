Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  get "users/show" => "user#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :rooms

  root 'rooms#index'
  
end
