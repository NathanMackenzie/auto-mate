Rails.application.routes.draw do
  resources :users
  
  root 'users#new'
  
  get 'signup' => 'users#new'
end
