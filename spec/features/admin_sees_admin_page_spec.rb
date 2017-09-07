require 'rails_helper'

describe "an admin visits their dashboard" do
  it "and sees admin controls" do
    admin = User.create(username: "admin", password: "1234", admin: true)
    user1 = User.create(username: "user1", password: "1234",
                        admin: true, points: 50)
    user2 = User.create(username: "user2", password: "1234",
                        admin: true, points: 10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/users/#{admin.id}"
    click_on "Admin Dashboard"

    expect(page).to have_content("user1")
    expect(page).to have_content("user2")
    expect(page).to have_content("50")
    expect(page).to have_content("10")
  end
  it "a normal user tries to visit" do
    user = User.create(username: "user", password: "1234")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_users_path

    expect(page).to have_content("404")
  end
end