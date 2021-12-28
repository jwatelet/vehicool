# frozen_string_literal: true

describe 'Manage vehicles' do
  before do
    login_as(create(:user))
  end

  let!(:brand) { create(:brand) }
  let!(:vehicle1) { create(:vehicle) }
  let!(:vehicle2) { create(:vehicle) }
  let!(:vehicle3) { create(:vehicle) }
  let!(:department) { create(:department) }

  let!(:vehicle3) { create(:vehicle) }
  let!(:vehicle2) { create(:vehicle) }
  let!(:vehicle1) { create(:vehicle) }

  it 'Create a vehicle' do
    visit new_vehicle_path
    within('#vehicle_form') do
      fill_in 'Name', with: 'Test department'
      fill_in 'License plate', with: '1-ABC-876'
      fill_in 'Serial number', with: '345678P'
      fill_in 'Tax horsepower', with: '8'
      select brand.name, from: 'Brand'
      select department.name, from: 'Department'
    end
    click_button 'Create Vehicle'
    expect(page).to(have_content('Vehicle was successfully created'))
  end

  it 'Shows all vehicle' do
    visit vehicles_path
    expect(page).to(have_content(vehicle1.name))
    expect(page).to(have_content(vehicle2.name))
    expect(page).to(have_content(vehicle3.name))
  end
end
