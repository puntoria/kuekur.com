require 'rails_helper'

describe Event, type: :model do
  context 'associations' do
    it { should have_one(:location) }
    it { should have_one(:organizer) }

    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  it { should accept_nested_attributes_for(:location) }

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:url) }

    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:created) }
    it { should validate_presence_of(:updated) }

    it { should validate_presence_of(:status) }

    it do
      j should define_enum_for(:status)
        .with(%i[
                draft
                published
                canceled
                live
                ended
              ])
    end

    it do
      should define_enum_for(:ticket_class)
        .with(%i[
                free
                paid
                donation
              ])
    end

    it do
      should have_db_column(:shareable)
        .with_options(default: true)
    end
    it do
      should have_db_column(:show_remaining)
        .with_options(default: true)
    end
    it do
      should have_db_column(:listed)
        .with_options(default: true)
    end
    it do
      should have_db_column(:invite_only)
        .with_options(default: false)
    end
  end

  describe '.listed' do
    it 'only includes listed events' do
      listed = create(:event, :listed)
      _unlisted = create(:event, listed: false)

      expect(Event.listed).to eq [listed]
    end
  end

  describe '.upcoming' do
    it 'includes events that have not already ended' do
      create(
        :event,
        :listed,
        start_date: 4.weeks.ago,
        end_date: 3.weeks.ago
      )
      event_live = create(
        :event,
        :listed,
        start_date: Time.zone.now,
        end_date: 2.days.from_now
      )
      event_future = create(
        :event,
        :listed,
        start_date: 3.weeks.from_now,
        end_date: 4.weeks.from_now
      )

      upcoming_events_ids = Event.upcoming.to_a.map(&:id)

      expect(upcoming_events_ids).to eq([event_live.id, event_future.id])
    end
  end
end
