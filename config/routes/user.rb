resources :users, controller: 'users' do
  resource :password,
           controller: 'clearance/passwords',
           only: %i[create edit update]
end
