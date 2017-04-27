Rails.application.routes.draw do


    root 'users#index'
    get '/posts/search' => 'posts#search'

  # get '/users' => 'users#index'
  resources :users

#   root GET    /                         users#index
#   users GET    /users(.:format)          users#index
#         POST   /users(.:format)          users#create
# new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#    user GET    /users/:id(.:format)      users#show
#         PATCH  /users/:id(.:format)      users#update
#         PUT    /users/:id(.:format)      users#update
#         DELETE /users/:id(.:format)      users#destroy

resources :posts do
  resources :comments
end

delete '/logout' => 'sessions#destroy', as: :logout
resources :sessions, only: [:new, :create]



get '/comments/new' => 'comments#new', as: :new_comment

  post '/posts/:id' => 'comments#create', as: :comments

  delete 'posts/:id' => 'comments#destroy'
end
