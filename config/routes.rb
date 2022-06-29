Rails.application.routes.draw do
  resources :company_data
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # auth token : eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NTY1NzQyMDZ9.DROtn0X1QYy6YiNfg-WE_x_8voBNdFPZ1JwzKTMeVww

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

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
