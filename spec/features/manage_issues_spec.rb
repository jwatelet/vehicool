# frozen_string_literal: true

describe 'Manage issues' do
  before do
    login_as(create(:user, email: 'user@example.com', password: 'password'))
  end

  let!(:vehicle) { create(:vehicle) }
  let!(:issue) { build(:issue, vehicle: vehicle) }
  let!(:issue1) { create(:issue, vehicle: vehicle) }
  let!(:issue2) { create(:issue, vehicle: vehicle) }
  let!(:issue3) { create(:issue, vehicle: vehicle) }

  it 'Create an issue' do
    visit vehicle_path(vehicle.id)
    within('#issue_form') do
      fill_in 'issue_text', with: issue.text
      fill_in 'issue_kilometer', with: issue.kilometer
    end
    click_button 'Create Issue'
    expect(page).to(have_content(issue.text))
    expect(page).to(have_content(issue.kilometer))
  end

  it 'Shows all issues' do
    visit vehicle_path(vehicle.id)
    expect(page).to(have_content(issue1.text))
    expect(page).to(have_content(issue2.text))
    expect(page).to(have_content(issue3.text))
  end
end
