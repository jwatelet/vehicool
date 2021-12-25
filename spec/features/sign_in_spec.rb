require "rails_helper"

feature "Signing in" do
  background do
    FactoryBot.create(:user, email: "user@example.com", password: "password")
  end

  scenario "Signing in with correct credentials" do
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
    end
    click_button "Log in"
    expect(page).to have_content "Signed in successfully"
  end

  scenario "Signing in with bad password" do
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "bad_password"
    end
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password"
  end

  scenario "Signing in with bad email" do
    visit new_user_session_path
    within("#new_user") do
      fill_in "Email", with: "user1@example.com"
      fill_in "Password", with: "password"
    end
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password"
  end
end
