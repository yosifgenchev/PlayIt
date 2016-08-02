Rails.application.routes.draw do

  get    '/events/new',   to: 'events#new'
  post   '/events/new',   to: 'events#create'

  get 'sessions/new'

  get 'users/new'

  root 'homepage#home'

  get    '/help', 		to: 'static_pages#help'
  get    '/contacts', 	to: 'static_pages#contacts'
  get    '/home', 		to: 'homepage#home'
  get    '/signup',		to: 'users#new'
  post 	 '/signup',  	to: 'users#create'
  get    '/login',   	to: 'sessions#new'
  post   '/login',   	to: 'sessions#create'
  delete '/logout',  	to: 'sessions#destroy'

  resources :users

  get 'auth/:provider/callback', to: 'sessions#createFacebook'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroyFacebook', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  #root to: "homepage#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
