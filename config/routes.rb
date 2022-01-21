Rails.application.routes.draw do
  devise_for :users
  resources :films
  resource :user
  root 'films#index'
end
