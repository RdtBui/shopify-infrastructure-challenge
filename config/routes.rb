Rails.application.routes.draw do
  root 'pages#home'
  get 'report', to: 'pages#report'
  
  resources :items
end