Rails.application.routes.draw do
  root 'uploads#new'

  resources :uploads, only: [:new, :create]
end
