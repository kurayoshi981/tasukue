Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'

  resources :top, only: %i(index show)

  resources :list, only: %i(new create update edit destroy) do
    resources :card, only: %i(new create show update edit destroy)
  end
  resources :tweet, only: %i(index new create update edit destroy)
  # resources :likes, only: %i(create destroy)
end
