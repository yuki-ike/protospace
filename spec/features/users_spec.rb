require 'rails_helper'

feature 'sign_up' do
  scenario "adds a new user" do

    visit new_user_registration_path
    expect{
      fill_in 'Username', with: "aaaaaa"
      fill_in 'E-Mail', with: "mmmm@mmm.com"
      fill_in 'Password', with: "00000000"
      fill_in 'Member', with: "member"
      fill_in 'Profile', with: "profile"
      fill_in 'Works', with: "works"
      click_button "Save"
      }.to change(User, :count).by(1)

      save_and_open_page

  end
end

feature 'adds a new proto' do
  scenario "adds a new proto" do
    user = create(:user)
    visit new_user_session_path
      fill_in 'Email address', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

    visit new_prototype_path
    expect{
      click_link 'New Proto'
      fill_in 'Title', with: 'ttttt'
      fill_in 'Catch Copy', with: 'mmm'
      fill_in 'Concept', with: 'aaaaa'
      attach_file "prototype[contents_attributes][0][content]", "spec/fixtures/img/panda.jpg"
      1.upto(3){ |num|
      attach_file "prototype[contents_attributes][#{num}][content]", "spec/fixtures/img/panda.jpg"
      }
      click_button 'Publish'
      }.to change(Prototype, :count).by(1)

      save_and_open_page

  end
end