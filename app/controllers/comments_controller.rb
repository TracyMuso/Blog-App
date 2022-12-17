class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
