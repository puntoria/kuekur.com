require "rails_helper"

feature "User edits bookmarks" do 
  let(:user) { create(:user) }
  
  before do
    password = "password"
    sign_in_with user.email, password
  end

  scenario "add and remove bookmarks from search results" do 
    first_event = create(:event, :listed, user: user)

    search_for first_event.title
    expect(page).to have_content(first_event.title)
    click_on "Fav it"
    expect(page).to have_content("Successfully added bookmark.")

    search_for first_event.title
    click_on "Remove Bookmark"
    expect(page).to have_content("Successfully removed bookmark.")
  end

  scenario "navigating from the profile" do 
    create(:event, :listed, user: user)

    visit edit_profile_path(as: user)

    within("div.sidebar-area") do 
      click_link "Bookmarks"
    end

    click_link "Remove bookmark"

    expect(page).to have_content("Successfully removed bookmark.")
  end

  private

  def search_for(query)
  end

end
