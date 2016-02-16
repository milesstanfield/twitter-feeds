Rails.application.routes.draw do
  devise_for :users
  get '/feed/:twitter_user_id', to: 'feed#show', as: :feed
  resources :twitter_users
  root 'twitter_users#new'
end
