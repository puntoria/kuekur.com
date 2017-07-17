require "rails_helper"

feature "User edits personal information" do 
  scenario "from profile" do
    user = create(:user, name: "old", email: "old@example.com")

    new_settings = {
      email: "new@example.com",
      name: "new",
    }
    visit root_path(as: user)
    edit_profile(new_settings)

    expect(page).to have_success_flash
    expect(page).to have_text(new_settings[:email])
    expect(page).to have_text(new_settings[:address])
  end

  def edit_profile(attributes)
    fill_form_and_submit(:profile, :edit, attributes)
  end
end
