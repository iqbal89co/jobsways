Rails.application.routes.draw do
  get 'jobs/index'
  get 'jobs/show'
  get 'jobs/create'
  get 'jobs/update'
  get 'jobs/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/users/profile/:id', to: 'user_data#show'
  post '/users/profile/create', to: 'user_data#create'
  patch '/users/profile/:id', to: 'user_data#update'

end
