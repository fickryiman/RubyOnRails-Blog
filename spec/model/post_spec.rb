require 'rails_helper'

RSpec.describe 'Post', type: :model do
  before :each do
    @user = User.new(name: 'Fickry')
  end

  subject { Post.new(author: @user, title: 'Test Drive', text: 'Hallo this is text on test drive post') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be to long, maximum length is 250 characters' do
    subject.title = 'abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890'\
                    'abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890'\
                    'abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890'\
                    'abcdefghijklmnopqrstuvwxyz1234567890'
    expect(subject).to_not be_valid
  end

  it 'valid post' do
    subject.title = 'Test Drives'
    subject.comments_counter = 0
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'comments_counter should be only the integer' do
    subject.comments_counter = '1a'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should allow valid values' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'valid with comments_counter as the integer and value is greater or equal to 0' do
    subject.comments_counter = 1
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'likes_counter should be only the integer' do
    subject.likes_counter = '1a'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should allow valid values' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'valid with likes_counter as the integer and value is greater or equal to 0' do
    subject.comments_counter = 1
    subject.likes_counter = 1
    expect(subject).to be_valid
  end
end
