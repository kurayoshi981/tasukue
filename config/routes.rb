Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  post "likes/:tweet_id/create" =>"likes#create"
  post "likes/:tweet_id/destroy" =>"likes#destroy"
  resources :top, only: %i(index show)

  resources :list, only: %i(new create update edit destroy) do
    resources :card, only: %i(new create show update edit destroy)
  end
  resources :tweet, only: %i(index new create)
end
