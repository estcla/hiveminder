require 'rails_helper'

feature 'user deletes a hive', %{
  As a beekeeper with an unnecessary beehive
  I would like to delete that hive
  So I can pretend I never made it in the first place
} do
  scenario 'user successfully deletes a hive' do
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

    visit hives_path

    click_link "Delete"

    expect(page).to have_content "Hive deleted"
  end
end
