Rails.application.routes.draw do
  resources :company_data
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users/profile', to: 'user_data#show'
  # update biodata, update&upload resume, update status
  patch '/users/profile', to: 'user_data#update'
  get '/users/profile/downloadCV', to: 'user_data#show_resume'

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'


  get '/jobs', to: 'jobs#index'
  get '/jobs/:id', to: 'jobs#show'
  post '/jobs', to: 'jobs#create'
  patch '/jobs/:id', to: 'jobs#update'
  delete '/jobs/:id', to: 'jobs#destroy'
  
  get '/*a', to: 'application#not_found'
end
