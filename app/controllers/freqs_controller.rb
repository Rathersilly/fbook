class FreqsController< ApplicationController

  def create
    friend = User.find_by(id: params[:friend_id])
    if !current_user.friends.include?(friend)
      puts "DEBUG".red
      puts current_user.inspect
      puts friend.inspect
      freq = Freq.create(user_id: current_user.id, friend_id: friend.id,
                                      request_message: "Please be my friend!",
                                      status: :sent)
      flash[:success] = "Friend request sent to #{friend.name}!"
      redirect_to root_path
    else
      flash[:warning] = "#{friend.name} is already your friend"
      redirect_to root_path
    end
  end

  def accept
    freq = Freq.find(params[:freq])
    freq.update(status: :accepted)
    if freq.user.befriend(freq.friend)
      flash[:success] = "#{freq.user.name} is now your friend!" 
      redirect_to root_url
    else
      flash[:warning] = "could not create friendship"
      raise StandardError.new "Error creating friendship"
      redirect_to root_url
    end
  end

  def deny
    freq = Freq.find(params[:freq])
    freq.update(status: :denied)
    flash[:success] = "You have denied #{freq.user.name} your frienship!"
    redirect_to root_url
  end

  def cancel
    freq = Freq.find(params[:freq])
    freq.update(status: :cancelled)
      flash[:success] = "You have cancelled your frienship request to #{freq.friend.name}!"
    redirect_to root_url
  end
  def destroy
    freq = Freq.find(params[:freq])
    if freq.destroy
      flash[:success] = "You have cancelled your frienship request to #{freq.user.name}!"
    else
      flash[:warning] = "could not destroy friendship request"
      raise StandardError.new "Error destroying friendship request"
    end
    redirect_to root_url
  end


end
