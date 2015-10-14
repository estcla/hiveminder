require 'rails_helper'

feature 'user adds a tag to inspection', %{
  As a user interested in tracking hive progress
  I would like to add a tag to my inspection
  So I can refer back to it at a later point
} do

  scenario 'user successfully adds tag to hive' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_inspection_path

    fill_in "inspection[date]", with: "September 20th"
    fill_in "inspection[time_of_day]", with: "Morning"
    fill_in "inspection[tag_list]", with: "capped brood, healthy queen, calm"

    click_button 'Submit'

    expect(page).to have_content "Inspection added"
    expect(page).to have_content "healthy queen"
  end
end
