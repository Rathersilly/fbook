module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    current_user
    puts "User #{@user.id} (#{@user.name}, #{@user.email}) is logged in".green
  end
  
  def log_out
    session.delete(:user_id) if session[:user_id]
    @current_user = nil
  end

  def current_user
    # find will throw error if nil, while find_by wont
    #@current_user ||= User.find(session[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
