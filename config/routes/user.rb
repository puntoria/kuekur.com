resources :users, controller: 'users', except: [:new] do
  resource :password,
           controller: 'clearance/passwords',
           only: %i[create edit update]
end
