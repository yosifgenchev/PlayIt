Rails.application.routes.draw do

match 'auth/:provider/callback', to: 'sessions#createFacebook', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroyFacebook', as: 'signout', via: [:get, :post]

  get    '/events/new',   to: 'events#new'
  post   '/events/new',   to: 'events#create'

  get 'sessions/new'

  get 'users/new'

  root 'homepage#home'

  get    '/help', 		to: 'static_pages#help'
  get    '/contacts', 	to: 'static_pages#contacts'
  get    '/signup',		to: 'users#new'
  post 	 '/signup',  	to: 'users#create'
  get    '/login',   	to: 'sessions#new'
  post   '/login',   	to: 'sessions#create'
  delete '/logout',  	to: 'sessions#destroy'


  get '/places/new', to: 'places#new'
  post '/places/new', to: 'places#create'

  resources :users
  resources :places
  resources :events
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :userevents, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
