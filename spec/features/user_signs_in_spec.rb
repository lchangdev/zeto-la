require 'rails_helper'

feature 'User signs in', %Q{
  As a authenticated user
  I want to sign in
  So that I can continue to my profile page
} do

  scenario 'user signs in with facebook' do
    user = FactoryGirl.create(:user)
    visit root_path
    mock_auth(user)
    click_link 'sign in'

    expect(page).to have_content('sign out')
    expect(page).to have_content(user.name)
  end

  scenario 'invalid authentication' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit root_path

    click_link 'sign in'
    expect(page).to have_content('sign in')
    expect(page).to_not have_content('sign out')
  end
end
