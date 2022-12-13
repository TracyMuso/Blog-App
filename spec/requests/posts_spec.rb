require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
      expect(response.body).to include('all posts are found here')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
      expect(response.body).to include('post page')
    end
  end
end
