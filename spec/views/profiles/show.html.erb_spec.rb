require "rails_helper"

describe "profiles/show" do
  it "displays profile information" do
    user = build_stubbed(
      :user,
      email: "user@example.com",
      name: "First Last",
    )
    view_stub_with_return(signed_in?: true)
    profile = Profile.new(user: user)
    assign(:profile, profile)

    render

    expect(rendered).to have_text(profile.email)
    expect(rendered).to have_text(profile.name)
  end

  def have_selected(value)
    have_css %{[checked][value="#{value}"]}
  end

end
