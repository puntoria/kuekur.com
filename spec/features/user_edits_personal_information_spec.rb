require "rails_helper"

feature "User edits personal information" do
  context "from profile" do
    scenario "successfully" do
      edit_profile

      fill_in "profile[email]", with: "new@example.com"
      fill_in "profile[name]", with: "New User"
      fill_in "profile[password]", with: "password"
      fill_in "profile[birth_date]", with: "03/03/1990"
      fill_in "profile[age]", with: "27"
      select "Male", from: "profile[gender]"
      fill_in "profile[website]", with: "mozaixllc.com"
      fill_in "profile[bio]", with: "Last year, I got TESOL ICELT certificate at ITI which is recognized globally and I am still going on my self-development."

      click_on t("profiles.form.submit")

      expect(page).to have_content(t("profiles.update.success"))
    end

    scenario "unsuccessfully due to missing required fields" do
      edit_profile

      fill_in "profile[name]", with: "New User"
      fill_in "profile[birth_date]", with: "03/03/1990"
      fill_in "profile[age]", with: "27"
      select "Male", from: "profile[gender]"
      fill_in "profile[website]", with: "mozaixllc.com"

      click_on t("profiles.form.submit")

      expect(page).to have_content(t("profiles.update.error"))
    end
  end

  private

  def edit_profile
    sign_in

    visit edit_profile_path
  end
end
