class UsersController < ApplicationController
  before_action :set_user, only: %i[add_friend edit update show destroy]
  def index
    @users = User.all
  end
  def new
    @user = User.new

  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Signup successful!"
      redirect_to root_url
    else
      flash.now[:warning] = "Signup failed!"
      render 'new'
    end


  end
  def edit
  end
  def update
  end
  def show
  end
  def destroy
  end

  def add_friend
    
    current_user.active_friendships.create(friend_id: params[:id])
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
