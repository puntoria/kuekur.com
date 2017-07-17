class ProfilesController < ApplicationController
  def edit
  end

private

  def build_profile
    Profile.new(user: current_user)
  end
end
