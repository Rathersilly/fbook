class User < ApplicationRecord
  has_many :active_friendships, class_name: "Friendship"
  has_many :active_friends, class_name: "User",through: :active_friendships, source: :friend
  has_many :passive_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :passive_friends, through: :passive_friendships, source: :user
  has_secure_password

  def User.digest(string)
    BCrypt::Password.create(string)
  end
  def friends
    #active_friends + passive_friends
    puts "hi"
    #active_friends.merge(passive_friends)
    active_friends + passive_friends

  end
  def befriend(user)
    active_friendships.create(friend_id: user.id)
  end
end
