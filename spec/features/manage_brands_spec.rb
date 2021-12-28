# frozen_string_literal: true

require 'rails_helper'

describe 'Manage brands' do
  before do
    login_as(create(:user, email: 'user@example.com', password: 'password'))
  end

  let!(:brand3) { create(:brand) }
  let!(:brand2) { create(:brand) }
  let!(:brand1) { create(:brand) }

  it 'Create a brand' do
    visit new_brand_path
    within('#brand_form') do
      fill_in 'Name', with: 'Test brand'
    end
    click_button 'Create Brand'
    expect(page).to(have_content('Brand was successfully created'))
  end

  it 'Shows all brands' do
    visit brands_path
    expect(page).to(have_content(brand1.name))
    expect(page).to(have_content(brand2.name))
    expect(page).to(have_content(brand3.name))
  end
end
