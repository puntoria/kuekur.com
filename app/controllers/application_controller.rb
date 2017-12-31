class ApplicationController < ActionController::Base
  include Clearance::Controller

  protect_from_forgery with: :exception

  def current_user_is_admin?
    current_user && current_user.admin?
  end
  helper_method :current_user_is_admin?
end
