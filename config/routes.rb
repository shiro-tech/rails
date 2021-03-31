Rails.application.routes.draw do
  get 'sessions/new'
  get 'pages/link'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'pages#index'
  get 'pages/help'
  
  resources :users
  
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
end
