Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :products do
    resources :reviews, except: [:show, :index]
    collection do
    	get 'popular'
    end
  end
  
  root 'products#index'
end
