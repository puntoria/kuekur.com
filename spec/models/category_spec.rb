require "rails_helper"

describe Category, type: :model do
  it { should validate_presence_of(:name) }
end
