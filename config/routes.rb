Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  resources :recipes, only: [:index, :create]
  resources :users

  ## CREATE signup route
  post '/signup', to: 'users#create'
  ## SHOW auto-login feature route
  get '/me', to: 'users#show'

  ## CREATE login route
  post '/login', to: 'sessions#create'
  ## DESTROY logout route
  delete '/logout', to: 'sessions#destroy'

  # get '/recipes', to: 'recipes#index'
  # post '/recipes', to: 'recipes#create'
end
