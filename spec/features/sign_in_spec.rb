# frozen_string_literal: true

describe 'Signing in' do
  before do
    create(:user, email: 'user@example.com', password: 'password')
  end

  it 'with correct credentials' do
    visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to(have_content('Signed in successfully'))
  end

  it 'with bad password' do
    visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'bad_password'
    end
    click_button 'Log in'
    expect(page).to(have_content('Invalid Email or password'))
  end

  it 'with bad email' do
    visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to(have_content('Invalid Email or password'))
  end
end
