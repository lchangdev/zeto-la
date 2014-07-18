require 'rails_helper'

feature 'User creates a post', %Q{
  As a autehnicated user
  I want to be able to create a post
  So that I can share events and job leads with others.
} do

  scenario 'User creates a event post' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit root_path
    mock_auth(user)
    within "div.navbar" do
      click_link 'sign in'
    end

    click_link 'Posts'
    click_link 'Create New Post'

    fill_in 'Title', with: post.title
    fill_in 'Description', with: post.description
    fill_in 'Address', with: post.address
    fill_in 'Date', with: post.date
    select('Event', from: 'Role')

    click_on 'submit'

    expect(page).to have_content(post.title)
  end

  scenario 'Unauthorized user cannot create event post' do
    visit new_post_path

    click_link 'Posts'

    expect(page).to have_content('You need to sign in if you want to do that.')
  end

end
