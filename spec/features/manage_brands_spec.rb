require "rails_helper"

feature "Manage brands" do
  background do
    login_as(FactoryBot.create(:user, email: "user@example.com", password: "password"))
  end

  scenario "Create a brand" do
    visit new_brand_path
    within("#brand_form") do
      fill_in "Name", with: "Test brand"
    end
    click_button "Create Brand"
    expect(page).to have_content "Brand was successfully created"
  end

  given!(:brand1) { FactoryBot.create(:brand) }
  given!(:brand2) { FactoryBot.create(:brand) }
  given!(:brand3) { FactoryBot.create(:brand) }

  scenario "Shows all brands" do
    visit brands_path
    expect(page).to have_content brand1.name
    expect(page).to have_content brand2.name
    expect(page).to have_content brand3.name
  end
end