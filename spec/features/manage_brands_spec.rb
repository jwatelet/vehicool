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
end
