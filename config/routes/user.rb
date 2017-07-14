resources :users, controller: "users" do
  resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
end
