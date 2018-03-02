resources :conversations do
  member do
    post :reply
    post :trash
    post :untrash
  end
end
