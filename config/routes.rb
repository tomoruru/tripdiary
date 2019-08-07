Rails.application.routes.draw do
  
  root to: 'tripdiarys#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only:  [:show, :new, :create]
  resources :trips, only:  [:create,:destroy,:new,:index,:show]
  resources :tripdiarys, only: [:index]
end
