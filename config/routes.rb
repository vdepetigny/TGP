Rails.application.routes.draw do
resources :gossip
resources :user
resources :city
root 'gossip#index'
get '/team', to: 'static_pages#team'
get '/contact', to: 'static_pages#contact'
get '/welcome/:id', to: 'static_pages#welcome'
 
end
