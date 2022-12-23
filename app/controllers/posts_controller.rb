class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    user.post_countr -= 1
    post.destroy
    user.save
    redirect_to "/users/#{current_user.id}/posts"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
