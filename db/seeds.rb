# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

random = Random.new
user_qty = random.rand(3..10)

user_qty.times do |i|
	user = User.create(name: "User#{i+1}", bio: "A bio of User#{i+1}.")
	post_qty = random.rand(2..5)

	post_qty.times do |j|
		post = Post.create(title: "Post title #{j+1}", text: "Post text goes here", author: user)
		
		comment_qty = random.rand(20)
		comment_qty.times do |j|
			Comment.create(text: "Comment ##{j+1}", post: post, author: user)
		end
	end
end