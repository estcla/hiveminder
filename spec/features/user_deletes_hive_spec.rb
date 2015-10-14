require 'rails_helper'

feature 'user deletes a hive', %{
  As a beekeeper with an unnecessary beehive
  I would like to delete that hive
  So I can pretend I never made it in the first place
} do
  scenario 'user successfully deletes a hive' do
    user = FactoryGirl.create(:user)
    hive = FactoryGirl.create(:hive)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit hives_path

    click_button "Delete"

    expect(page).to have_content "Hive deleted"
  end

end
