class DashboardController < ApplicationController
  def home
    @users = User.all
  end
end
