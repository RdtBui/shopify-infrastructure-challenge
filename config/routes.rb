Rails.application.routes.draw do
  resources :logs
  root 'items#index'
  get 'report', to: 'pages#report'
  post 'report', to: 'pages#report'
  
  resources :items
end