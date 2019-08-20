Rails.application.routes.draw do
  
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'tripdiarys#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only:  [:show, :new, :create] do
    member do
      get :likes
    end
  end

  resources :trips, only:  [:create,:destroy,:new,:index,:show] do
    member do 
      post :favorite_trips
    end
  end
  resources :tripdiarys, only: [:index]
  resources :favorites, only:[:create,:destroy]
end
