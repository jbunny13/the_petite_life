Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  root 'products#index'
  get '/about' => 'static_pages#about'

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :articles do
    resources :comments, except: [:show]
  end
  resources :categories
  resources :products do
    resources :reviews, except: [:show]
  end
  resources :references, path: 'resources'
  resources :search, only: [:index]
  get '/search' => 'search#index'
  resources :tags
end
