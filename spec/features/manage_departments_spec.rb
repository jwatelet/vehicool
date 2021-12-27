feature "Manage departments" do
  background do
    login_as(FactoryBot.create(:user, email: "user@example.com", password: "password"))
  end

  scenario "Create a department" do
    visit new_department_path
    within("#department_form") do
      fill_in "Name", with: "Test department"
    end
    click_button "Create Department"
    expect(page).to have_content "Department was successfully created"
  end

  given!(:department1) { FactoryBot.create(:department) }
  given!(:department2) { FactoryBot.create(:department) }
  given!(:department3) { FactoryBot.create(:department) }

  scenario "Shows all brands" do
    visit departments_path
    expect(page).to have_content department1.name
    expect(page).to have_content department2.name
    expect(page).to have_content department3.name
  end
end
