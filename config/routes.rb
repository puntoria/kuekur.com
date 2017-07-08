Rails.application.routes.draw do
  root "marketing#index"

  resources :events, only: [:index]
end
