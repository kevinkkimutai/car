Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # # For student
  # root to: 'students#dashboard', constraints: lambda { |request| request.env['warden'].user&.student? }
  resources :students, only: [:index, :show, :update, :create, :destroy]
  # user login/register
  post "/users/login", to: "authentication#login"
  post "/users/register", to: "users#create"
  get '/user/me', to: 'users#show'
#admin
  post "data/admin", to: "admin#create"
#student
  post "data/student", to: "student#create"
  # reset password
  post "reset_password", to: "users#reset_password"
  put "update_password/:reset_password_token", to: "users#update_password"
  put "reset_password/:reset_password_token", to: "users#update_password"

 # pairs

  post '/pair_students', to: 'pairs#pair_students'
  get '/pairs/create', to: 'pairs#new'

  # Feedbacks routes
  get '/feedbacklist', to: 'feedbacks#index'
  post '/feedback', to: 'feedbacks#create'
  get '/feedback/:id', to: 'feedbacks#show'
  put '/feedback/:id', to: 'feedbacks#update'
  delete '/feedback/:id', to: 'feedbacks#destroy'

  # Instructors routes
  get '/instructors', to: 'instructors#index'
  post '/instructor', to: 'instructors#create'
  get '/instructor/:id', to: 'instructors#show'
  put '/instructor/:id', to: 'instructors#update'
  delete '/instructor/:id', to: 'instructors#destroy'

  # Messagings routes
  get '/messages', to: 'messages#index'
  post '/message', to: 'messages#create'
  get '/message/:id', to: 'messages#show'
  put '/message/:id', to: 'messages#update'
  delete '/message/:id', to: 'messages#destroy'


# get students
get '/students', to: "students#index"

 #randomly pair students
  get '/pair_students', to: 'pairs#pair_students'
  post '/pairs', to: 'pairs#create'
  #get all pairs
  get '/pairs', to: 'pairs#index' 
  
#deletes a pair by id
  delete '/pairs/:id', to: 'pairs#destroy'

#delete all pairs
delete '/pairs', to: 'pairs#destroy_all'



resources :cars
resources :photos


 


end

