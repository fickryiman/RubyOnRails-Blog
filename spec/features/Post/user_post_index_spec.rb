require 'rails_helper'

RSpec.feature 'User Post Index Page' do
  let!(:user) { User.create(name: 'user1', photo: 'https://unsplash.com/photos/a-man-with-a-white-beard-and-a-gray-turban-l9-G4RM_LYc', posts_counter: 0) }
  let!(:post) do
    Post.create(author_id: user.id, title: 'Test Post', text: 'This is the body of the post.', comments_counter: 0,
                likes_counter: 0)
  end
  let!(:comment1) { Comment.create(user:, post:, text: 'Comment 1') }
  let!(:comment2) { Comment.create(user:, post:, text: 'Comment 2') }

  scenario 'Displays username, profile picture, number of posts and total likes' do
    visit user_posts_path(user)
    expect(page).to have_css("img[src='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of post: #{user.posts.count}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  scenario 'Displays post title and some of the post body' do
    visit user_posts_path(user)
    expect(page).to have_content(post.title)
    expect(page).to have_content('This is the body of the post.')
  end

  scenario 'Displays the first comments on a post & total comments' do
    visit user_posts_path(user)
    expect(page).to have_content(comment2.text)
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end
end
