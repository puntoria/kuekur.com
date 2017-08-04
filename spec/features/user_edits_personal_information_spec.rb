require "rails_helper"

feature "User edits personal information" do
  scenario "from profile" do
    user = create(:user, name: "old", email: "old@example.com")
    new_settings = {
      name: "new",
      email: "new@example.com",
      password: "password"
    }

    visit root_path(as: user)
    edit_profile(new_settings)

    expect(page).to have_success_flash
    expect(page).to have_text(new_settings[:name])
    expect(page).to have_text(new_settings[:email])
    expect(page).to have_text(new_settings[:password])
  end

  def edit_profile(attributes)
    fill_form_and_submit(:profile, :edit, attributes)
  end

  def have_success_flash
  end
end
