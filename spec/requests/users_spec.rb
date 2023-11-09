require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:valid_attributes) do
    { name: 'Mark', posts_counter: 0 }
  end

  describe 'GET /index' do
    before :each do
      get users_path
    end

    it 'should return a successful response' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('No users registered')
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create! valid_attributes
      get user_path(@user)
    end

    it 'should return a succesful response' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Number of post')
    end
  end
end
