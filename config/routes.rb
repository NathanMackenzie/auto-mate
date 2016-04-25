Rails.application.routes.draw do
  resources :users
  
  root 'static_pages#home'
  
  get 'index' => 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  get 'signup' => 'users#new'
  get 'profile' => 'users#show'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
