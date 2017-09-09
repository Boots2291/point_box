Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :rewards, only: [:index]
  namespace :admin do
    resources :users, only: [:index, :new, :create, :show, :edit, :update]
  end
  get "login", to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete "logout", to: 'sessions#destroy'
  get '/buy', to: 'users#buy'
end
