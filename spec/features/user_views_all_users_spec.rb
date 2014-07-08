require 'rails_helper'

feature 'Returning user signs in and sees all users', %Q{
  As a authenticated user
  I want to be able to see all users
  So that I can contact with other users.
} do

  scenario 'Returning user views all users' do
    user1 = FactoryGirl.create(:user, :with_address, :with_cohort)
    user2 = FactoryGirl.create(:user, :with_address, :with_cohort)
    visit root_path
    mock_auth(user1)
    click_link 'sign in'

    click_link 'Enter'

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  scenario 'Unauthenticated user cannot view list of users' do
    visit users_path

    expect(page).to have_content 'You need to sign in if you want to do that.'
  end
end
