Rails.application.routes.draw do
  resources :feeds
  resources :twitter_users
  root 'twitter_users#new'
end
