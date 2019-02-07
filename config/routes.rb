Rails.application.routes.draw do
resources :gossip do
	resources :comment
end
resources :user
resources :city

root 'gossip#index'
get '/team', to: 'static_pages#team'
get '/contact', to: 'static_pages#contact'
get '/welcome/:id', to: 'static_pages#welcome'
 
end
