Rails.application.routes.draw do
  get 'card/new'
  get 'card/create'
  devise_for :users
  root 'top#index'
  resources :list, only: %i(new create update edit destroy) do
    resources :card, only: %i(new create)
  end
end
