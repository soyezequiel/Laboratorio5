Rails.application.routes.draw do
  resources :monsters, only: [:show,:index, :update, :create]
  resources :tweets
  root "tweets#index"
end
