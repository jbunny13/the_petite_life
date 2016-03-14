Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'

  root 'products#index'

  devise_for :users, controllers: {registrations: 'registrations'}
  
  resources :articles do
    resources :comments, except: [:show]
  end
  resources :categories
  resources :products do
    resources :reviews, except: [:show]
  end
  resources :references, path: 'resources'
  resources :searches, path: :search, only: [:index]
  resources :tags
end
