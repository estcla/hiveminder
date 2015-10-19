require 'rails_helper'

feature 'user edits profile', %Q{
  As a returning user
  I want to change my profile page
  Because accuracy.
} do

  scenario 'successfully edits profile' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit edit_user_registration_path


    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'Thisismynewpassword'
    fill_in 'Password confirmation', with: 'Thisismynewpassword'
    fill_in 'Current password', with: user.password
    fill_in 'Name', with: 'Dave'

    click_button "Update"
    visit user_path(user.id)

    expect(page).to have_content('Dave')
  end
end
