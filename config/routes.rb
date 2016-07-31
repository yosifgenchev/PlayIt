Rails.application.routes.draw do
  
  #root 'application#hello'

  root 'static_pages#help'

  get  '/help', to: 'static_pages#help'
  get  '/contacts', to: 'static_pages#contacts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
