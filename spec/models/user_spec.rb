require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end
end
