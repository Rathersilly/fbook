class DashboardController < ApplicationController
  def home
    @users = User.all
    @my_posts = current_user.posts.all
    puts @my_posts
  end
end
