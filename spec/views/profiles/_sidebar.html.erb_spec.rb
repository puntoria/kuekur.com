require "rails_helper"

describe "profiles/_sidebar.html.erb" do
  it "displays profile information" do
    user = build_stubbed(
      :user,
      email: "user@example.com",
      name: "First Last",
    )
    view_stub_with_return(signed_in?: true)

    profile = Profile.new(user: user)
    assign(:profile, profile)

    render "sidebar", profile: profile

    expect(rendered).to have_text(profile.name)
    expect(rendered).to have_text(profile.email)
  end

end
