require "rails_helper"

describe Event, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:url) }

    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:created) }
    it { should validate_presence_of(:updated) }

    it { should validate_presence_of(:status) }

    it do
      should define_enum_for(:status).
        with([
          canceled: 0, 
          live: 1, 
          started: 2, 
          ended: 3, 
          completed: 4
        ])
    end

    it do
      should have_db_column(:shareable).
        with_options(default: true)
    end
    it do
      should have_db_column(:show_remaining).
        with_options(default: true)
    end
    it do
      should have_db_column(:listed).
        with_options(default: true)
    end
    it do
      should have_db_column(:invite_only).
        with_options(default: false)
    end
  end

  context "associations" do
  end

  describe ".listed" do
    it "only includes listed events" do
      listed = create(:event, :listed)
      _unlisted = create(:event, listed: false)

      expect(Event.listed).to eq [listed]
    end
  end
end
