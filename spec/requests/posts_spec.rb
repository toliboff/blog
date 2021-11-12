require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    user = User.create(name: 'Tolib', bio: 'Student learning Ruby on Rails')
    Post.create(title: 'Post title', text: 'Lorem ipsum dolor set amet...', author: user)
    before(:example) { get user_posts_path(1) }

    it 'should have correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Student learning Ruby on Rails')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(1, 1) }

    it 'should have correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Lorem ipsum dolor set amet...')
    end
  end
end
