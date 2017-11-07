Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :home
  resources :orders do
      resources :items
  end

  # post '/' => 'home#create'
  # delete '/' => 'home#destory'

  get '/orders' => 'orders#new'


end
