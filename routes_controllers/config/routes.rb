Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :artworks, only: [:show, :update, :create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]

  # get '/users', to: 'users#index', as: 'users'
  # post '/users', to: 'users#create', as: 'create_user' 
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/:id', to: 'users#show', as: 'show_user'
  # patch '/users/:id', to: 'users#update', as: 'update_user' 
  # put '/users/:id', to: 'users#update', as: 'updateuser'
  # delete '/users/:id', to: 'users#destroy', as: 'delete_user'
  get '/users/:user_id/artworks', to: 'artworks#index', as: 'user_artworks'
 
  resources :users do 
    resources :comments, only: [:index]
  end

  resources :artworks do 
    resources :comments, only: [:index]
  end
end
