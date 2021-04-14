class User < ApplicationRecord
  # dependent: destroy needed for all?
  has_many :active_friendships, class_name: "Friendship",
            dependent: :destroy
  has_many :active_friends, class_name: "User",
            through: :active_friendships, source: :friend
  has_many :passive_friendships, class_name: "Friendship",
            foreign_key: :friend_id, dependent: :destroy
  has_many :passive_friends, through: :passive_friendships,
            source: :user
  has_secure_password

  def User.digest(string)
    BCrypt::Password.create(string)
  end

  def friends
    active_friends + passive_friends
  end

  def befriend(friend)
    active_friendships.create(friend_id: friend.id)
  end

  def unfriend(friend)
    # find out if its active or passive?

    f = active_friendships.find_by(friend_id: friend.id)
    f ||= passive_friendships.find_by(friend_id: friend.id)
    if f
      f.destroy
    else
      puts "could not find that friend"
    end
  end
    


end
