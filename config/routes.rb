Rails.application.routes.draw do

resources :gossip
resources :user
root 'gossip#index'
    get '/team', to: 'static_pages#team'
    get '/contact', to: 'static_pages#contact'
    get '/welcome/:id', to: 'static_pages#welcome'    
  # get 'user/index'
  # get 'user/show'
  # get 'user/new'
  # get 'user/create'
  # get 'user/edit'
  # get 'user/update'
  # get 'gossip/index'
  # get 'gossip/show'
  # get 'gossip/new'
  # get 'gossip/create'
  # get 'gossip/edit'
  # get 'gossip/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
