Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :list, only: %i(new create update edit destroy) do
    resources :card, only: %i(new create show update edit destroy)
  end
end
