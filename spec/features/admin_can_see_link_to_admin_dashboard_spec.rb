require 'rails_helper'

describe "a user visits their show page" do
  it "as an admin" do
    admin = User.create(username: "admin", password: "1234", admin: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/users/#{admin.id}"

    expect(page).to have_content("Hi, #{admin.username}")
    expect(page).to have_content("Admin Dashboard")
  end
  it "as a normal user" do
    user = User.create(username: "user", password: "1234")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/users/#{user.id}"

    expect(page).to have_content("Hi, #{user.username}")
    expect(page).to_not have_content("Admin Dashboard")
  end
end