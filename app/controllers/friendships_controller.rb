class FriendshipsController< ApplicationController
  def remove_friend
    friend = User.find_by(id: params[:friend_id])
    if current_user.friends.include?(friend)
      if current_user.unfriend(friend)
        flash[:success] = "#{friend.name} is no longer your friend!" 
        redirect_to root_path
      else
        flash[:warning] = "can't find that friendship wtf"
        redirect_to root_path
      end
    end
  end



end

