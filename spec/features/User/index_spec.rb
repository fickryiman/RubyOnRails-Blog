require 'rails_helper'
RSpec.feature 'User Index Page' do
  # Create some test users and posts
  let!(:user1) { User.create(name: 'user1', photo: 'https://unsplash.com/photos/a-man-with-a-white-beard-and-a-gray-turban-l9-G4RM_LYc', posts_counter: 0) }
  let!(:user2) { User.create(name: 'user2', photo: 'https://unsplash.com/photos/a-man-with-red-lipstick-on-his-face-OaSkiXe0vQA', posts_counter: 0) }
  let!(:post1) { Post.create(author: user1, title: 'user1 post test') }
  let!(:post2) { Post.create(author: user2, title: 'user2 post test') }
  scenario 'Displays usernames' do
    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end
  scenario 'Displays profile pictures' do
    visit users_path
    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
  end
  scenario 'Displays post counts' do
    visit users_path
    expect(page).to have_content("Number of post: #{user1.posts_counter}")
    expect(page).to have_content("Number of post: #{user2.posts_counter}")
  end
  scenario 'Redirects to user show page when clicked' do
    visit users_path
    click_link user1.name
    sleep(1)
    expect(current_path).to eq(user_path(user1))
  end
end