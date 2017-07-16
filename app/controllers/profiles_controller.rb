class ProfilesController < ApplicationController
  def sshowhow
    @profile = build_profile
  end

  private

  def build_profile
    Profile.new(user: current_user)
  end
end
