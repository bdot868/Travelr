Rails.application.routes.draw do


    root 'users#index'
    resources :cities
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

delete '/logout' => 'sessions#destroy', as: :logout
resources :sessions, only: [:new, :create]

resources :posts
end
