require 'rails_helper'

feature 'user adds a general inspection', %{
  As a beekeeper interested in logging hive inspections
  I would like to create a posting for every inspection I make
  So I can carefully monitor my inspections
} do

  scenario 'user successfully add a general inspection' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_inspection_path

    fill_in "inspection[date]", with: "September 20th"
    fill_in "inspection[time_of_day]", with: "Morning"

    click_button 'Submit'

    expect(page).to have_content "Inspection added"
    expect(page).to have_content "Morning"
  end

  scenario 'user totally fails at general inspection' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_inspection_path

    fill_in "inspection[time_of_day]", with: "Morning"

    click_button 'Submit'

    expect(page).to have_content "Date can't be blank"
  end
end
