require 'rails_helper'

feature 'User contacts launcher', %Q{
  As a authenticated user
  I want to be able to email a launcher
  So that I can further expand my network.
} do

  scenario 'user receives confirmation email and sends request email' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    visit root_path
    mock_auth(user2)

    within "div.navbar" do
      click_link 'sign in'
    end

    click_link 'Enter'
    ActionMailer::Base.deliveries = []

    page.first('.email-link').click
    fill_in 'Title', with: 'Generic Title'
    fill_in 'Description', with: 'Generic Description'

    click_button 'submit'

    expect(page).to have_content('Successfully sent your request.')
    expect(ActionMailer::Base.deliveries.size).to eql(2)
    first_email = ActionMailer::Base.deliveries.first
    last_email = ActionMailer::Base.deliveries.last

    expect(last_email).to have_subject("Request to connect with #{user.name}.")
    expect(last_email).to deliver_to(user.email)
    expect(last_email).to have_body_text("Dear #{user.name},")

    expect(first_email).to have_subject("Request sent to #{user.name}")
    expect(first_email).to deliver_to(user2.email)
    expect(first_email).to have_body_text("Dear #{user2.name},")
  end
end
