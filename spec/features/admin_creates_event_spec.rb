require "rails_helper"

feature "Admin creates event" do 
  scenario "from the dashboard" do
    visit_new_events_page_as_admin


    expect(page).to have_content("Site Administration")
  end

  scenario "display validation errors" do 
    user = create(:user)

    sign_in_as(user)

    visit rails_admin_path(as: user)

    expect(page).to have_content("You are not permitted to view this page")
  end


  private

  def visit_new_events_page_as_admin
    admin = create(:admin)

    sign_in_as(admin)

    visit edit_profile_path(as: admin)

    find(:xpath, '/html/body/div/div[1]/a').click
  end
end
