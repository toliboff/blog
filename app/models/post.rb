class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_post_counter

  def last_comments
    comments.last(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
