require "rails_helper"

feature "User edits events" do 
  context "when there are events" do
    scenario "shows a list of events" do
      user = create(:user)

      sign_in_as(user)

      first_event = create(:event, :listed, user: user)

      visit edit_profile_path(as: user)

      within("div.sidebar-area") do 
        click_link "My Events"
      end

      click_link first_event.title

      expect(page).to have_content(first_event.title)
      expect(page).to have_content(first_event.description)
      expect(page).to have_content(first_event.end_date.to_formatted_s(:short))
    end
  end

  context "when there are no events" do 
    scenario "shows an appropriate message" do
      user = create(:user)

      sign_in_as(user)

      visit edit_profile_path(as: user)

      within("div.sidebar-area") do 
        click_link "My Events"
      end

      expect(page).to have_content(t(".profile.events.no_events"))
    end
  end

  private

  def sign_in_as(user)
    password = "password"
    sign_in_with user.email, password
  end
end
