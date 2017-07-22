class ProfilesController < ApplicationController
  before_filter :require_login, only: [:edit]

  def edit
  end

  private

  def build_profile
    Profile.new(user: current_user)
  end
end
