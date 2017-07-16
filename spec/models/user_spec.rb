require "rails_helper"

describe User do
  context "validations" do
    it { should validate_presence_of(:name) }
  end
  
  context "#first_name" do
    it "has a first_name that is the first part of name" do
      user = User.new(name: "first last")
      expect(user.first_name).to eq "first"
    end
  end

  context "#last_name" do
    it "returns everything except the first name" do
      user = User.new(name: "First Last")
      expect(user.last_name).to eq "Last"

      user_with_multi_part_last_name = User.new(name: "First van der Last")

      expect(user_with_multi_part_last_name.last_name).to eq "van der Last"
    end
  end

end
