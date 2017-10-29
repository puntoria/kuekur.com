require "rails_helper"

describe Organizer, type: :model do
  context "associations" do
    it { should belong_to(:event) }
  end
  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
