Rails.application.routes.draw do
  resources :food_entries
  resources :foods
  resources :users

  post '/login', to: 'auth#login'
  get '/persist', to: 'auth#persist'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
