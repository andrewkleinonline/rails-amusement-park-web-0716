Rails.application.routes.draw do

  root "sessions#homepage"
  resources :users
  resources :sessions, only: [:create, :destroy]
  resources :attractions, only: [:show, :index, :new, :create, :edit, :update]
  get '/signin', to: 'sessions#new', as: 'signin'
  #post '/sessions', to: 'sessions#create', as: 'sessions'
end
