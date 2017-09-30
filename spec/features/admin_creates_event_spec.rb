require "rails_helper"

feature "Admin creates event" do 
  scenario "from the dashboard" do
    visit_events_page_as_admin

    click_on "Create New Events"

    expect(page).to have_content("New Event")
  end

  scenario "display validation errors" do 
  end


  private

  def visit_events_page_as_admin
    admin = create(:user, :admin)

    sign_in_as(admin)

    visit events_admin_path(as: admin)
  end
end
