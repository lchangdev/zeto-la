require 'rails_helper'

feature 'User able to delete account', %Q{
  As a authenticated user
  I want to be able to delete my account.
} do

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user, :with_address, :with_cohort)
      visit root_path
      mock_auth(@user)
      click_link 'sign in'
      click_link 'Enter'
    end

    scenario 'user delets account' do
      click_link 'Edit'
      click_link 'delete account'

      expect(page).to have_content('You have successfully deleted your account.')
      expect(page).to have_content('sign in')
    end

    scenario 'unauthorized user uable to delete another users account' do
      user2 = FactoryGirl.create(:user, :with_id, :with_address, :with_cohort)
      visit edit_user_path(user2)

      expect(page).to have_content('You are not authorized to do that.')
    end
  end

  scenario 'unauthenticated user cannot delete account' do
    user = FactoryGirl.create(:user, :with_id, :with_address, :with_cohort)
    visit edit_user_path(user)

    expect(page).to have_content('You need to sign in if you want to do that.')
  end

end
