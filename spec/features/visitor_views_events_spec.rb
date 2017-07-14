require "rails_helper"

feature "Views events" do
  scenario "sees all event details" do
    login_with_oauth

    create_events

    visit_events_page

    expect(page).to have_content(first_event.title)
    expect(page).to have_content(first_event.description)
    expect(page).to have_content(first_event.end_date.to_formatted_s(:short))
    expect(page).to have_content(second_event.title)
    expect(page).to have_content(second_event.description)
    expect(page).to have_content(second_event.end_date.to_formatted_s(:short))
  end

  private

  def login_with_oauth
  end

  def create_events
    first_event
    second_event
  end

  def first_event
    @first_event ||= create(:event)
  end

  def second_event
    @second_event ||= create(:event)
  end

  def visit_events_page
    visit root_path
    click_link(t("application.header.events"), match: :first)
  end
end
