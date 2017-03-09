Rails.application.routes.draw do

  resources :games, only: %w(new create)

  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
end
