require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'GET /index' do
    subject { User.new(name: 'Tolib', photo: 'no photo', bio: 'Student learning Ruby on Rails') }
    before { subject.save }

    it 'Name must not be blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'PostsCounter must be an integer' do
      subject.posts_counter = 1.5
      expect(subject).to_not be_valid
    end

    it 'PostsCounter must be greater than or equal to zero.' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
