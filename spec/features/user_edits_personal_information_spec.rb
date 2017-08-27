require "rails_helper"

feature "User edits personal information" do
  let(:user) { create(:user) }

  before do
    sign_in
  end

  scenario "from profile" do
    edit_profile

    attributes = {
      name: "New User",
      password: "password", # Current password.
      age: "31",
      gender: "Male",
    }

    fill_form(:profile, attributes)

    click_on "Send"

    expect(page).to have_text(attributes[:name])
    expect(page).to have_text(attributes[:age])
    expect(page).to have_text(attributes[:gender])
  end

  def edit_profile
    visit edit_profile_path(as: user)
  end
end
