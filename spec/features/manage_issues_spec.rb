require "rails_helper"

feature "Manage issues" do
  background do
    login_as(FactoryBot.create(:user, email: "user@example.com", password: "password"))
  end

  given!(:vehicle) { FactoryBot.create(:vehicle) }
  given!(:issue) { FactoryBot.build(:issue, vehicle: vehicle) }

  scenario "Create an issue" do
    visit vehicle_path(vehicle.id)
    within("#issue_form") do
      fill_in "issue_text", with: issue.text
      fill_in "issue_kilometer", with: issue.kilometer
    end
    click_button "Create Issue"
    expect(page).to have_content issue.text
    expect(page).to have_content issue.kilometer
  end

  given!(:issue1) { FactoryBot.create(:issue, vehicle: vehicle) }
  given!(:issue2) { FactoryBot.create(:issue, vehicle: vehicle) }
  given!(:issue3) { FactoryBot.create(:issue, vehicle: vehicle) }

  scenario "Shows all issues" do
    visit vehicle_path(vehicle.id)
    expect(page).to have_content issue1.text
    expect(page).to have_content issue2.text
    expect(page).to have_content issue3.text
  end
end
