Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'pages/link'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'pages#index'
  get 'pages/help'
  
  resources :users
  resources :topics
  
  #いいね実装のためのroutes
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  #コメント実装のためのroutes（確認テスト）
  get 'comments/new'
  get 'comments/index'
  post '/comments', to: 'comments#create'
  delete '/comments', to: 'comments#destroy'
  #session実装のためのroutes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
