class PostsController < ApplicationController
  before_action :set_users
  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)

    if post.save
      redirect_to root_path
      flash[:success] = "Post created!"
    else
      flash[:warning] = "Post could not be created!"
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def set_users
    @users = User.all
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
