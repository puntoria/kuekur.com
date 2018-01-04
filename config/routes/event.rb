resources :events, only: [:index, :show, :new, :create] do
  resource :bookmarks, only: [:create, :destroy]
  member do
    get "rsvp"
  end
end
