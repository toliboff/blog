class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_post_counter
    user.update(posts_counter:Post.where(user_id:user).count)
  end

  def last_comments
    comments.last(5)
  end
end
