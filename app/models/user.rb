class User < ApplicationRecord
  # dependent: destroy needed for all?
  has_many :active_friendships, class_name: "Friendship",foreign_key: :user_id,
            dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship",
            foreign_key: :friend_id, dependent: :destroy
  # 90% sure this cant work - moved functionality to methods instead
   has_many :active_friends, class_name: "User",
             through: :active_friendships, source: :friend
   has_many :passive_friends,# class_name: "User",
             through: :passive_friendships, source: :user

  has_secure_password

  def User.digest(string)
    BCrypt::Password.create(string)
  end

=begin
  def active_friends
    active_friends = []
    active_friendships.each do |fs|
      active_friends << User.find(fs.friend_id)
    end
    active_friends
  end
  
  def passive_friends
    passive_friends = []
    passive_friendships.each do |fs|
      passive_friends << User.find(fs.user_id)
    end
    passive_friends
  end
=end

  def friends
    active_friends + passive_friends
  end

  def befriend(friend)
    if not friends.include?(friend)
      active_friendships.create(friend_id: friend.id)
      true
    else
      Flog.info "#{self} is already friends with #{friend}"
      puts "#{self} is already friends with #{friend}"
      false
    end
  end

  def unfriend(friend)
    # find out if its active or passive?

    f = active_friendships.find_by(friend_id: friend.id)
    f ||= passive_friendships.find_by(user_id: friend.id)
    if f
      f.destroy
    else
      puts "could not find that friend"
    end
  end
    


end
