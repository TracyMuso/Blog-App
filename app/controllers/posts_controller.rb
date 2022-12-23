class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    render json: @posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    respond_to do |format|
      format.html
      format.json do
        if current_user.id == params[:id].to_i
          render json: @post
          render json: @comments
        else
          render html: 'You do not have permission to see this'
        end
      end
    end
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
    user = User.find(post.author_id)
    user.posts_counter -= 1
    post.destroy
    user.save
    redirect_to "/users/#{current_user.id}/posts"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
