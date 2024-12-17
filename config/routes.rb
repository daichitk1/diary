Rails.application.routes.draw do
  resources :developments
  resources :onedays
  resources :one_diaries
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :memos
  resources :posts
  get '/posts_all', to: 'posts#all'
  root 'posts#index' 
  get 'home/index'
  get '/one_days_concrete', to: 'onedays#concrete'
  get 'tags/:name', to: 'tags#show', as: 'tag'
  end
