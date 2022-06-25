Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/users/profile/:id', to: 'user_data#show'
  post '/users/profile', to: 'user_data#create'
  patch '/users/profile/:id', to: 'user_data#update'

  get '/jobs', to: 'jobs#index'
  get '/jobs/:id', to: 'jobs#show'
  post '/jobs', to: 'jobs#create'
  patch '/jobs/:id', to: 'jobs#update'
  delete '/jobs/:id', to: 'jobs#destroy'
end
