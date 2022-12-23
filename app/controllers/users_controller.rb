class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json do
        if current_user.id == params[:id].to_i
          render json: @user.posts
        else
          render html: 'You do not have permission to see this'
        end
      end
    end
  end
end
