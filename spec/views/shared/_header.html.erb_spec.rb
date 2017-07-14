require "rails_helper"

describe "shared/_header.html.erb" do
  context "when the user is signed in" do
    it "renders the user's avatar" do
      user = create(:user, name: "Joe")
      view_stub_with_return(signed_in?: true)
      view_stub_with_return(current_user: user )

      render

      expect(rendered).to have_text("Joe")
      expect(rendered).to have_css(<<-CSS.strip)
       img[src='#{user.avatar.url(:thumb)}']
      CSS
    end
  end

  context "when the user isn't signed in" do
    it "shows a sign in link" do
      view_stub_with_return(signed_in?: false)

      render

      expect(rendered).to have_content("Sign in")
    end
  end

  def have_link_for(path:, user:)
    have_css(%{a[href="#{path(user)}"]})
  end
end
