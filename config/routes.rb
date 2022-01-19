Rails.application.routes.draw do
  root 'items#index'
  get 'reports', to: 'reports#index'
  post 'reports', to: 'reports#index'

  resources :items
  resources :logs
end
