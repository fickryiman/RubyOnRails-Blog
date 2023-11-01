require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:valid_attributes) do
    { name: 'Mark', posts_counter: 0 }
  end

  describe 'GET /index' do
    before :each do
      @user = User.create! valid_attributes
      get user_posts_path(@user)
    end

    it 'should return a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('List of All Posts based on user id')
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create! valid_attributes
      @post = @user.posts.create(title: 'Test post')
      get "/users/#{@user.id}/posts/#{@post.id}/"
      # get user_post_path(@user, @post)
    end

    it 'should return a successful response' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('List of All Posts based on user id')
    end
  end
end
