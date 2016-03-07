Rails.application.routes.draw do
  resources :tags
  resources :references
  resources :comments
  resources :articles
  resources :categories
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :products do
    resources :reviews, except: [:show, :index]
  end
  
  root 'products#index'
end
