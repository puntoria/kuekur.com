require "rails_helper"

describe Location, type: :model do
  describe "associations" do
    it { should belong_to(:locatable) }
  end

  describe "validations" do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  it do
    [
      :long_name,
      :short_name,
      :types,
      :formatted_address,
      :location_type,
      :place_id].each do |field|
        should have_db_column(field)
      end
  end

  it do
    should have_db_column(:latitude).of_type(:decimal).
      with_options(precision: 15, scale: 10, null: false)
  end

  it do
    should have_db_column(:longitude).of_type(:decimal).
      with_options(precision: 15, scale: 10, null: false)
  end
end
