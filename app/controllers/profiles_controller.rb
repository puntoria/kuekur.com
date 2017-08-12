class ProfilesController < ApplicationController
  before_filter :require_login

  def edit
    @profile = build_profile
  end

  def update
    @profile = build_profile

    if @profile.update(profile_params)
      redirect_to edit_profile_path, flash: { success: t(".success") }
    else
      flash[:error] = t(".error")
      render :edit
    end
  end

  private

  def build_profile
    Profile.new(user: current_user)
  end

  def profile_params
    params.require(:profile).permit(
      :name, 
      :email, 
      :password, 
      :birth_date, 
      :age,
      :avatar,
      :gender,
      :phone_number,
      :website,
      :bio
    )
  end
end
