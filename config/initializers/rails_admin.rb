RailsAdmin.config do |config|
  config.main_app_name = 'kuekur.com'
  config.parent_controller = '::ApplicationController'
  config.authorize_with do |_controller|
    unless current_user && current_user.admin?
      redirect_to(
        main_app.root_path,
        alert: 'You are not permitted to view this page'
      )
    end
  end
  config.model 'Event' do
    edit do
      field :title
      field :description
      field :image
      field :shareable
      field :show_remaining
      field :listed
      field :invite_only
      field :status
      field :capacity
      field :online_event
      field :event_type
      field :refund_policy
      field :currency
      field :source
      field :ticket_class

      field :user
      field :category
      field :organizer
      field :location
    end
  end
  config.model 'Category' do
    edit do
      configure :ancestry do
        hide
      end
    end
  end
  config.model 'User' do
    edit do
      configure :password_confirmation do
        hide
      end
    end
  end
  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
