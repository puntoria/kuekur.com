require "rails_helper"

describe Event, type: :model do
  describe ".listed" do
    it "only includes listed events" do
      listed = create(:event, :listed)
      _unlisted = create(:event, listed: false)

      expect(Event.listed).to eq [listed]
    end
  end
end
