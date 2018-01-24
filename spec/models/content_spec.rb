require "rails_helper"

describe Content, type: :model do
  describe "assocations" do
    it { should belongs_to(:section).touch(true) }
  end

  describe "validations" do
    it { should validates_presence_of(:title) }
    it { should validates_presence_of(:description) }
    it { should validates_presence_of(:section_id) }
  end
end
