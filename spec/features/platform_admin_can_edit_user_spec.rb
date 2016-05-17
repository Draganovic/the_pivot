require 'rails_helper'

RSpec.feature "platform admin can edit any user" do
  scenario "platform sees updated user after editing" do
    city = create(:city_with_homes, name: "Denver", state: "CO")
    host = create(:user)
    home = city.homes.first
    original_home_name = home.title
    host.roles << Role.create(name: "host")
    home.users << host
    platform_admin = create(:user, email: "pa@admin.co", password: "password")
    platform_admin.roles << Role.create(name: "platform_admin")
    user1 = User.create(first_name: "Sam", last_name: "Watson", email: "emailz@hotmail.com", password: "password")
    user1.roles << Role.create(name: "registered_user")
    user2 = User.create(first_name: "Sally", last_name: "Watson", email: "email3@hotmail.com", password: "password")
    user2.roles << Role.create(name: "registered_user")

    visit root_path

    click_link "Login"

    expect(current_path).to eq '/login'
    fill_in "email", with: "#{platform_admin.email}"
    fill_in "password", with: "password"
    click_button "Login"

    visit '/users'

    click_on "Edit User #{user1.first_name}'s Account"

    expect(current_path).to eq(edit_user_path(user1))
    fill_in "First Name", with: "Pablo"
    fill_in "Last Name", with: "Sanchez"
    fill_in "Email", with: "new_email@gmail.com"
    click_on "Update Account"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content "Pablo"
    expect(page).to have_content "Sanchez"
    expect(page).to have_content "new_email@gmail.com"

    expect(page).to_not have_content "Sam"
    expect(page).to_not have_content "Watson"
    expect(page).to_not have_content "email@hotmail.com"

  end
end
