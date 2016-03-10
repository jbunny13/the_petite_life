Rails.application.routes.draw do
  resources :references, path: 'resources'
  resources :articles do
    resources :comments, except: [:show]
  end
  resources :categories
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :products do
    resources :reviews, except: [:show]
  end
  
  root 'products#index'
end
