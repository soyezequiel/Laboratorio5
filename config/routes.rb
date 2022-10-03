Rails.application.routes.draw do
  resources :monsters, only: [:index, :update, :create]

  root "monsters#index"
end
