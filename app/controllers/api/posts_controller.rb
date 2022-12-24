class Api::PostsController < Api::ApplicationController
  before_action :set_post, only: [:show]
  def index
    posts = Post.all.order(:id)
    render json: posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end
end
