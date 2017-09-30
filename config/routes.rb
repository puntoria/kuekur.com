class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(
      Rails.root.join("config/routes/#{routes_name}.rb")
    ))
  end
end

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  constraints Clearance::Constraints::SignedIn.new do
    get "/" => 'marketing#index'
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "marketing#index"
  end

  draw :user
  draw :profile
  draw :event
end
