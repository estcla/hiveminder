require 'rails_helper'

feature 'user edits a hive', %{
  As a user that has created hives
  I would like to be able to edit their contents
  So they'll have accurate information
} do

  scenario 'user successfully edits a hive' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_hive_path

    fill_in "hive[name]", with: "Hivey Hive"
    fill_in "hive[location]", with: "Backyard"
    fill_in "hive[established]", with: "Spring 2015"
    fill_in "hive[health]", with: "Fair"

    click_button 'Submit'

    click_link 'Edit Hive'

    fill_in "hive[name]", with: "New Thing"

    click_button 'Submit'

    expect(page).to have_content("New Thing")
  end
end
