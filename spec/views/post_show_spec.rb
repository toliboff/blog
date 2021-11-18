require 'rails_helper'
RSpec.describe 'Post', type: :system do
  describe 'show page' do
    before do
      visit new_user_session_path
      @tolib = User.create(name: 'Tolib', bio: 'Tolib is a frontend developer', email: 'tolib@mail.com',
                           password: '123456', password_confirmation: '123456', confirmed_at: Date.today)
      @adam = User.create(name: 'Adam', bio: 'Adam is a backend developer', email: 'adam@mail.com', password: '123456',
                          password_confirmation: '123456', confirmed_at: Date.today)

      5.times do |j|
        post = Post.create(title: "Post ##{j + 1}", text: "#{j + 1}Lorem ipsum dolor set amet.", author: @tolib)
        Comment.create(text: 'Random comment', post: post, author: @tolib)
        Comment.create(text: 'Random comment', post: post, author: @adam)
      end

      fill_in 'Email', with: 'tolib@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Tolib'
      click_link 'See all post'
      click_link 'Post #1'
    end

    it 'I can see the post\'s title.' do
      expect(page).to have_content('Post #1')
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content('Post #1')
      expect(page).to have_content('by')
      expect(page).to have_content('Tolib')
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content('Comments: 2')
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content('Likes: 0')
    end

    it 'I can see the post body.' do
      expect(page).to have_content('1Lorem ipsum dolor set amet.')
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content('Adam')
      expect(page).to have_content('Tolib')
    end
    it 'I can see the comment each commentor left' do
      expect(page).to have_content('Adam: Random comment')
      expect(page).to have_content('Tolib: Random comment')
    end
  end
end