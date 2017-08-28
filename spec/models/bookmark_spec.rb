require "rails_helper"

describe Bookmark, type: :model do
  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end
end
