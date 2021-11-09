Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  # resources :users

  # users show and delete
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'users#destroy'

  # register
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  #login and logout
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root 'posts#index'
end
