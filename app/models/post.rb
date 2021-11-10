class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :likes
  has_many :comments

  def last_comments
    comments.last(5)
  end

  private

  def update_post_counter
    author.update!(:posts_counter)
  end
end
