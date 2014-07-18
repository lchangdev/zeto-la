require 'rails_helper'

feature 'User views all posts', %Q{
  As a authenticated User
  I want to be able to view all posts
  So that I can be well informed
} do

  scenario 'user views list of all posts' do
    user = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post)
    post2 = FactoryGirl.create(:post)
    post3 = FactoryGirl.create(:post)

    visit root_path
    mock_auth(user)
    within "div.navbar" do
      click_link 'sign in'
    end

    click_link 'Posts'

    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
  end

  scenario 'Unauthorized user cannot view event posts' do
    visit posts_path

    click_link 'Posts'

    expect(page).to have_content('You need to sign in if you want to do that.')
  end
end
