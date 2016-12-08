Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/calendar', to: 'static_pages#calendar'
  get '/weather', to: 'static_pages#weather'

  resources :funerals
  resources :customers
end
