require "rails_helper"

feature "User creates event" do 
  scenario "from profile" do
    user = create(:user)

    visit edit_profile_path(as: user)

    attributes = attributes_for(:event, user: user)

    fill_form(:event, attributes)

    click_on "Save"

    expect(page).to have_content("Event created successfully")
    expect(Event.count).to eq 1
  end

  scenario "displays validation errors" do
  end

end
