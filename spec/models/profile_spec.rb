require "rails_helper"

describe Profile do 
  context "#delegations" do
    %w(email name gender birth_date gender age email_verified phone_verified phone_number).each do |field|
      it { should delegate_method(field.to_sym).to(:user) }
    end
  end

  describe "#update" do
    context "when valid" do
      it "updates the User" do
        user = build(
          :user,
          email: "old@example.com",
          name: "old",
        )
        profile = Profile.new(user: user)

        updated_attributes = {
          email: "new@example.com",
          name: "new",
        }

        profile.update(updated_attributes)

        expect(profile.user).to have_attributes(updated_attributes)
      end
    end

    context "when invalid" do
      it "exposes errors from the User" do
        user = build_stubbed(:user)
        profile = Profile.new(user: user)

        profile.update(email: nil)

        expect(profile.errors).not_to be_empty
      end
    end
  end
end
