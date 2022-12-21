require 'rails_helper'

RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Baraka Danny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Am a ruby developer', posts_counter: 9)
    @first_post = Post.create(title: 'Hello', body: 'This is a post', comments_counter: 0, likes_counter: 0,
                              author_id: @user.id)
    5.times do |_i|
      @comment = Comment.create(text: 'Interesting topic', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(user_id: @user.id, id: @first_post.id)
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'displays the author name' do
    expect(page).to have_content(@first_post.author.name)
  end

  scenario 'displays number of comments' do
    expect(page).to have_content(@first_post.comments_counter)
  end

  scenario 'displays number of likes' do
    expect(page).to have_content(@first_post.likes_counter)
  end

  scenario 'displays the content of the post' do
    expect(page).to have_content(@first_post.body)
  end

  scenario 'displays comments' do
    expect(page).to have_content(@comment.text)
  end

  scenario 'displays the username of each commentor' do
    expect(page).to have_content(@comment.author.name)
  end

  scenario 'I can see the comment each commentor left.' do
    expect(page).to have_content('Interesting topic')
  end
end
