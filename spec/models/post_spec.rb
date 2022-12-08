require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject do
    Post.new(title: 'My post', text: 'Hello! My name is King shukur.', author: user1, comments_counter: 3,
             likes_counter: 2)
  end

  before { user1.save subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'post length should be more than 10 charachters' do
    subject.text = 'Hello'
    expect(subject).to_not be_valid
  end

  it 'post should belong to an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
end
