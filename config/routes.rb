Rails.application.routes.draw do
  devise_for :users
  resources :list_items
  get 'home/about'
  root 'home#index'
end
