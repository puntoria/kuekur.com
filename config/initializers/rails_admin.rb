RailsAdmin.config do |config|
  config.main_app_name = "kuekur.com"
  config.parent_controller = "::ApplicationController"

  config.authorize_with do |controller|
    unless current_user && current_user.admin?
      redirect_to(
        main_app.root_path,
        alert: "You are not permitted to view this page"
      )
    end
  end
  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
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
      field :source

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

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
