require "rails_helper"

describe LandingPage do
  describe "#upcoming_events" do
    it "returns the upcoming events" do 
      user = build(:user)
      events = create_list(
        :event,
        5,
        :listed,
        user: user,
        start_date: Time.zone.now,
        end_date: Time.zone.now + 1.hours
      )
      allow(Event).to receive(:upcoming).and_return(events)

      result = LandingPage.new.upcoming_events

      expect(result).to eq(events)
      expect(Event).to have_received(:upcoming)
    end
  end

  describe "#recently_published_events" do
    it "returns the most recent events" do
      user = build(:user)
      events = create_list(
        :event,
        5,
        :listed,
        user: user,
        created_at: Time.zone.now
      )
      allow(Event).to receive(:newest_first).and_return(events)

      result = LandingPage.new.recently_published_events

      expect(result).to eq(events)
      expect(Event).to have_received(:newest_first)
    end
  end
end
