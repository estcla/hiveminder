require 'rails_helper'

feature 'user adds a hive', %{
  As a beekeeper with one or many beehives
  I would like to add each one to my profile page
  So I can display and keep track of my hives
} do

  scenario 'user successfully adds a hive' do
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

    click_button 'Create Hive'

    expect(page).to have_content "Hive added!"
  end

  scenario 'user unsuccessfully adds a hive' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_hive_path

    fill_in "hive[location]", with: "Backyard"
    fill_in "hive[established]", with: "Spring 2015"
    fill_in "hive[health]", with: "Fair"

    click_button 'Create Hive'

    expect(page).to have_content "Name can't be blank"
  end
end
