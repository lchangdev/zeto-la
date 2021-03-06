require 'rails_helper'

feature 'User signs in', %Q{
  As a user
  I want to sign in
  So that I can be autenticated and redirected to index page
} do

  scenario 'user signs in with facebook' do
    user = FactoryGirl.create(:user)
    visit root_path
    mock_auth(user)

    within "div.navbar" do
      click_link 'sign in'
    end

    expect(page).to have_content('sign out')
    expect(page).to have_content(user.name)
  end

  scenario 'invalid authentication' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit root_path

    within "div.navbar" do
      click_link 'sign in'
    end

    expect(page).to have_content('sign in')
    expect(page).to_not have_content('sign out')
  end
end
