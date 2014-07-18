require 'rails_helper'

feature 'User edits their own post', %Q{
  As a authenticated User and author of post
  I want to be able to edit my post
  So that I can correct or update my post
} do

  scenario 'user edits post' do
    user = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post)
    post2 = FactoryGirl.create(:post)

    visit root_path
    mock_auth(user)
    within "div.navbar" do
      click_link 'sign in'
    end

    click_link 'Posts'
    click_link post1.title
    click_link 'edit'

    fill_in 'Title', with: 'Updated title'

    click_on 'submit'

    expect(page).to have_content('Updated title')
    expect(page).to have_content('Successfully edited your post.')
    expect(page).to_not have_content(post1.title)
  end
end
