require 'rails_helper'

RSpec.describe Post, type: :model do
  author1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject do
    Post.new(title: 'My post', body: 'Hello! My name is King shukur.', author: author1, comments_counter: 1,
             likes_counter: 2)
  end

  before { author1.save }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end
end
