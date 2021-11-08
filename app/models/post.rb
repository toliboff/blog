class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_post_counter
    user.update(posts_counter:Post.where(user_id:user).count)
  end

  
end
