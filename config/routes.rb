Rails.application.routes.draw do
  resources :gossip do
	resources :comment
	resources :likes
  end
  resources :user, only: [:new, :create, :show]
  resources :city, only: [:show]
  resources :session, only: [:new, :create, :destroy]
  resources :contacts, only: [:index]
  resources :team, only: [:index]

  root 'gossip#index'
end
