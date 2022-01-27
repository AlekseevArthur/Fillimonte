Rails.application.routes.draw do
  devise_for :users
  resources :films do
    resources :comments
    resource  :rating
  end
  resource :user do
    resource :watchlater
    resource :viewed
  end
  root 'films#index'
end
