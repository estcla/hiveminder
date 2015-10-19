require 'rails_helper'

feature 'user searches for inspections by tag', %{
  As a user with many inspections and limited patience
  I would like to be able to search according to tags
  So I can quickly pull up all inspections with that tag
} do

  scenario 'user successfully searches for tag' do
    user = FactoryGirl.create(:user)
    inspections = []
    5.times do
      inspection = FactoryGirl.create(:inspection, user: user)
      inspections << inspection
    end

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit hives_path

    fill_in 'search', with: inspections[3].time_of_day
    click_button 'Search'

    expect(page).to have_content(inspections[3].time_of_day)
    expect(page).to_not have_content(inspections[2].time_of_day)
  end
end
