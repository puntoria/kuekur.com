require "rails_helper"

describe Section, type: :model do
  describe "associations" do
    it { should have_many(:contents).dependent(:destroy) }
  end

  describe "validations" do
    it { should validates_presence_of(:title) }
  end
end
