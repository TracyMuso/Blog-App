require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
    before { @user = (name: 'Tracy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student at Microverse.', posts_counter: 3) }

    scenario 'should display all users' do
        visit users_path
        expect(page).to have_content(@user.name)
    end

    scenario 'should display post counter' do
        visit users_path
        expect(page).to have_content(@user.posts_counter)
    end
end