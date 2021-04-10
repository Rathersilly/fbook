class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Successfully logged in. Welcome #{@user.name}!"
      log_in @user
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def admin_login
    @user = User.find(params[:id])
    log_in(@user)
    redirect_to root_path
  end

end
