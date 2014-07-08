require 'rails_helper'

feature 'User signs in for the first time', %Q{
  As a authenticated user
  I want to update my profile with my address, cohort and optionally company name
  So that I can help other launchers.
} do

  scenario 'As first time user, must update information' do
    user = FactoryGirl.create(:user)
    visit root_path
    mock_auth(user)
    click_link 'sign in'

    click_button 'Enter'
    fill_in 'Address', with: user.address
    fill_in 'Company name', with: user.company_name
    select('Summer 2014', from: 'cohort')
    click_on 'submit'

    expect(page).to have_content('Successfully updated your information.')
    expect(page).to have_content user.name
  end

  scenario 'Unauthenticated user cannot update information' do
    visit root_path

    expect(page).to have_content('Please sign in first.')
  end
end
