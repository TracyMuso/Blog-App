require 'rails_helper'

RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Baraka Danny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Dummy text for testing')
    @first_post = Post.create(title: 'Hello', body: 'This is a post text', likes_counter: 0,
                              author_id: @user.id)
    5.times do |_i|
      @comment = Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_posts_path(@user)
  end

  scenario 'displays profile picture' do
    expect(page).to have_css('img')
  end

  scenario 'display username' do
    expect(page).to have_content(@user.name)
  end

  scenario 'display number of posts' do
    expect(page).to have_content(@user.posts_counter)
  end

  scenario 'display first 5 comments' do
    expect(page).to have_content(@comment.text)
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario "display some of the post's body." do
    expect(page).to have_content(@first_post.body)
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content(@first_post.likes_counter)
  end

  scenario 'display the how many Comments' do
    expect(page).to have_content(@first_post.comments_counter)
  end

  scenario 'display pagination button' do
    expect(page).to have_content('pagination')
  end

  scenario 'clicking on a post title redirects to the post show page' do
    click_link(@first_post.title)
    expect(page).to have_content(@first_post.title)
  end
end
