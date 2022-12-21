require 'rails_helper'

RSpec.describe 'Users Show Page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Kamila', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from New York.')
    @user2 = User.create(name: 'MArtin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from somewhere.')
    @post_one = Post.create(author: @user1, title: 'Intro', body: 'This is my first post')
    @post_two = Post.create(author: @user2, title: 'Promo', body: 'hello ya`ll!')
  end

  scenario 'should display user name' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@user1.name)
  end

  scenario 'should display user bio' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@user1.bio)
  end

  scenario 'should display user picture' do
    visit user_path(id: @user1.id)
    expect(page).to have_css('img')
  end

  scenario 'should display user posts counter' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@user1.posts_counter)
  end

  scenario 'should display users first three posts' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@post_one.title)
    expect(page).to have_content(@post_one.body)
  end

  scenario 'should display link to all posts' do
    visit user_path(id: @user1.id)
    expect(page).to have_link('See all posts')
  end

  scenario ' click see all posts button, it redirects me to the user`s post`s index page.' do
    visit user_path(id: @user1.id)
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user1))
  end

  scenario 'should redirect to post page' do
    visit user_path(id: @user1.id)
    click_link(@post_one.title)
    expect(page).to have_current_path(user_post_path(user_id: @user1.id, id: @post_one.id))
  end
end
