Rails.application.routes.draw do
  resources :users
  
  root 'users#new'
  
  get 'signup' => 'users#new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
