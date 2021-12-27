feature "Manage vehicles" do
  background do
    login_as(FactoryBot.create(:user))
  end

  given!(:brand) { FactoryBot.create(:brand) }
  given!(:department) { FactoryBot.create(:department) }

  scenario "Create a vehicle" do
    visit new_vehicle_path
    within("#vehicle_form") do
      fill_in "Name", with: "Test department"
      fill_in "License plate", with: "1-ABC-876"
      fill_in "Serial number", with: "345678P"
      fill_in "Tax horsepower", with: "8"
      select brand.name, from: "Brand"
      select department.name, from: "Department"
    end
    click_button "Create Vehicle"
    expect(page).to have_content "Vehicle was successfully created"
  end

  given!(:vehicle1) { FactoryBot.create(:vehicle) }
  given!(:vehicle2) { FactoryBot.create(:vehicle) }
  given!(:vehicle3) { FactoryBot.create(:vehicle) }

  scenario "Shows all vehicle" do
    visit vehicles_path
    expect(page).to have_content vehicle1.name
    expect(page).to have_content vehicle2.name
    expect(page).to have_content vehicle3.name
  end
end
