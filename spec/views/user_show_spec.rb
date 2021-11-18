require 'rails_helper'
RSpec.describe 'User show page', type: :system do
  describe 'user show page' do
    before do
      visit new_user_session_path
      tolib = User.create(name:'Tolib', bio:'Tolib is a frontend developer', email:"tolib@mail.com", password:'123456', password_confirmation:'123456', confirmed_at:Date.today)
      adam = User.create(name:'Adam', bio:'Adam is a backend developer', email:"adam@mail.com", password:'123456', password_confirmation:'123456', confirmed_at:Date.today)
      
      5.times do |j|
        Post.create(title:"Post ##{j+1}", text:"#{j+1}Lorem ipsum dolor set amet.", author:tolib)
      end
      fill_in 'Email', with: 'tolib@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Tolib'
    end
    it 'I can see the user\'s profile picture.' do
      expect(page).to have_css('img.users-image')
    end
    it 'I can see the user\'s username.' do
      expect(page).to have_content('Tolib')
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 5')
    end
    it 'I can see the user\'s bio' do
      expect(page).to have_content('Tolib is a frontend developer')
    end
  end
end
