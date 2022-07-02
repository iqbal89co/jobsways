Rails.application.routes.draw do
  resources :applications, controller: 'job_applications'
  resources :companies, controller: 'company_data'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users/profile', to: 'user_data#show'
  # update biodata, update&upload resume, update status
  patch '/users/profile', to: 'user_data#update'
  get '/users/profile/downloadCV', to: 'user_data#show_resume'

  get '/users/company', to: 'user_company#show'
  post '/users/company', to: 'user_company#create'
  patch '/users/:username/invite_to_company', to: 'user_company#invite'

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'


  get '/jobs', to: 'jobs#index'
  get '/jobs/:id', to: 'jobs#show'
  post '/jobs', to: 'jobs#create'
  patch '/jobs/:id', to: 'jobs#update'
  delete '/jobs/:id', to: 'jobs#destroy'
  
  get '/*a', to: 'application#not_found'
end
