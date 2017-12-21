Rails.application.routes.draw do
  devise_for :users
  root 'uploads#new'

  resources :uploads, only: [:new, :create]
end
