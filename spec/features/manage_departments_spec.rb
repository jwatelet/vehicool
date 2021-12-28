# frozen_string_literal: true

describe 'Manage departments' do
  before do
    login_as(create(:user, email: 'user@example.com', password: 'password'))
  end

  let!(:department3) { create(:department) }
  let!(:department2) { create(:department) }
  let!(:department1) { create(:department) }

  it 'Create a department' do
    visit new_department_path
    within('#department_form') do
      fill_in 'Name', with: 'Test department'
    end
    click_button 'Create Department'
    expect(page).to(have_content('Department was successfully created'))
  end

  it 'Shows all brands' do
    visit departments_path
    expect(page).to(have_content(department1.name))
    expect(page).to(have_content(department2.name))
    expect(page).to(have_content(department3.name))
  end
end
