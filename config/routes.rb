Rails.application.routes.draw do
  resources :users
  resources :facebooks
  
  root 'users#new'
  
  get 'index' => 'users#new'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  get 'home' => 'users#new'
  get 'signup' => 'users#new'
  get 'profile' => 'users#show'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  
  get 'facebook_signup' => 'facebooks#new'
  post 'facebook_signup' => 'facebooks#create'
end
