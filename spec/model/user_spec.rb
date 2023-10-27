require 'rails_helper'

RSpec.describe 'User', type: :model do
  subject do
    User.new(name: 'Bil Iman',
             photo: 'https://unsplash.com/photos/a-black-and-white-photo-of-a-man-holding-a-child-Ho-D_R4MfYc', bio: 'Man in mistaken')
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'valid user' do
    subject.name = 'Fickry'
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'posts_counter should be only the integer' do
    subject.posts_counter = '1a'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should allow valid values' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'valid with posts_counter as the integer and value is greater or equal to 0' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end
end
