Rails.application.routes.draw do
  resources :one_diaries
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :memos
  resources :posts
  get '/posts_all', to: 'posts#all'
  root 'posts#index' 
  get 'home/index'
  end
