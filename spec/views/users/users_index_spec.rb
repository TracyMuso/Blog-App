require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Kamila', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from New York.')
    @user2 = User.create(name: 'MArtin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from somewhere.')
    @post_one = Post.create(author: @user1, title: 'Intro', body: 'This is my first post')
    @post_two = Post.create(author: @user2, title: 'Promo', body: 'hello ya`ll!')
  end

  scenario 'should display all users' do
    visit '/'
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'should display post counter' do
    visit '/'
    expect(page).to have_content(@user1.posts_counter)
  end

  scenario 'should display user picture' do
    visit '/'
    expect(page).to have_css('img')
  end

  scenario 'should redirect to user page' do
    visit '/'
    click_link(@user1.name)
    expect(page).to have_current_path(user_path(id: @user1.id))
  end
end
