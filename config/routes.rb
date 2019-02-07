Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
resources :gossip do
	resources :comment
end
resources :user
resources :city
resources :session, only: [:new, :create, :destroy]

root 'gossip#index'
get '/team', to: 'static_pages#team'
get '/contact', to: 'static_pages#contact'
get '/welcome/:id', to: 'static_pages#welcome'
 
end
