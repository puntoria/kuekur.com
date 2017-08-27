require "rails_helper"

feature "User edits personal information" do
  let(:user) { create(:user) }

  before do
    sign_in
  end

  scenario "from profile" do
    attributes = {
      name: "New",
      email: "new@example.com",
      password: "password",
      birth_date: "08/15/1992",
      age: "28",
      gender: "Male",
      phone_number: "+2-843-754-3060",
      website: "mozaixllc.com",
      bio: "Capybara matchers are supported in view specs"
    }

    visit edit_profile_path(as: user)

    fill_form(:profile, attributes)

    click_button "Send"

    expect(page).to have_text(attributes[:name])
    expect(page).to have_text(attributes[:email])
    expect(page).to have_text(attributes[:birth_date])
    expect(page).to have_text(attributes[:age])
    expect(page).to have_text(attributes[:gender])
    expect(page).to have_text(attributes[:phone_number])
    expect(page).to have_text(attributes[:website])
    expect(page).to have_text(attributes[:bio])
  end

  def edit_profile_page(user)
  end
end
