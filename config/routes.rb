Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :dashboard, only: [:index]
  resources :categories
  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end
  resources :jobs do
    resources :comments
  end
end
