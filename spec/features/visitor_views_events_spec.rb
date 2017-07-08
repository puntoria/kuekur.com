require "rails_helper"

feature "Views events" do 
  scenario "sees all event details" do 
    login_with_oauth
    visit root_path

    create_events

    visit events_path

    expect(page).to have_content(first_event.title)
    expect(page).to have_content(first_event.description)
    expect(page).to have_content(first_event.timezone)
    expect(page).to have_content(second_event.title)
    expect(page).to have_content(second_event.description)
    expect(page).to have_content(second_event.timezone)
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
end
