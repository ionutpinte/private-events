Rails.application.routes.draw do

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/newEvent', to: 'events#new'

  get '/invite', to: 'attendments#new'

  resources :users

  resources :events

  resources :attendments

end
