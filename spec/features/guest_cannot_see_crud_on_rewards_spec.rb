require 'rails_helper'

describe "a user visits the rewards index" do
  it "and does not see edit or delete" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit rewards_path

    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
    expect(page).to have_content("Rewards")
    expect(page).to have_content("Name")
    expect(page).to have_content("Cost")
    expect(page).to have_content("Purchase")
  end
end