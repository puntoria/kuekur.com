require "rails_helper"

describe "shared/_header.html.erb" do
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
