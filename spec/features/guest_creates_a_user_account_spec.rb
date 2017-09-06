require 'rails_helper'

RSpec.describe "guest becomes a user" do
  context "guest creates a new user" do
    it "sees and fills out new user form" do
      visit '/'

      expect(page).to have_link("Sign Up")

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in "user[username]", with: "mb"
      fill_in "user[password]", with: "1234"

      click_on 'Create User'

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Hi, mb")
      expect(page).to have_link("Logout")

      # click_on "Logout"
      #
      # expect(current_path).to eq(root_path)
      #
      # expect(page).to have_link("Already a user? Click Here")
      #
      # click_on "Already a user? Click Here"
      #
      # expect(current_path).to eq(login_path)
      #
      # fill_in "session[username]", with: "mb"
      # fill_in "session[password]", with: "1234"
      #
      # click_on "Login"
      #
      # expect(page).to have_content("Hi, mb")
    end
  end
end