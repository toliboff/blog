require 'rails_helper'

RSpec.describe 'Login page', type: :system do
  describe 'index page' do
    before :each do
      visit new_user_session_path
      User.create(name:'Tolib', email:"tolib@mail.com", password:'123456', password_confirmation:'123456', confirmed_at:Date.today)
    end

    it 'shows the username and password inputs' do
      expect(page).to have_css('input[type="email"]')
      expect(page).to have_css('input[type="password"]')
    end

    it 'shows the "Submit" button' do
      expect(page).to have_button('Log in')
    end

    it 'click the submit button without filling in the email and the password shows the Error message' do
      click_button 'Log in'
      expect(page).to have_content("Invalid Email or password")
    end

    it 'filling email and password fields with incorrect data shows the Error message' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content("Invalid Email or password")
    end

    it 'filling email and password fields with correct data redirects to the root page' do
      fill_in 'Email', with: 'tolib@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end


  end
end
