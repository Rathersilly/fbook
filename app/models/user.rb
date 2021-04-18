class User < ApplicationRecord
  # dependent: destroy needed for all?

  # when foreign:key: :user_id wasnt commented out,
  # was creating duplicate friendships
  has_many :active_friendships, class_name: "Friendship",#foreign_key: :user_id,
            dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship",
            foreign_key: :friend_id, dependent: :destroy
   has_many :active_friends, class_name: "User",
             through: :active_friendships, source: :friend
   has_many :passive_friends,class_name: "User",
             through: :passive_friendships, source: :user

   has_many :active_freqs, class_name: "Freq",
            dependent: :destroy
   has_many :passive_freqs, class_name: "Freq",
            foreign_key: :friend_id, dependent: :destroy

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
  def freqs
     active_freqs.or(passive_freqs)
  end

  def friends
    #TODO change this to merge(or) like freqs above
    #dont want to change now cuz it works
    active_friends + passive_friends
    # ok i tried this, but get "relation passed to #or must be structurally compatible"
    # active_friends.or(passive_friends)
    # oh and this doesnt work - dont want to return friendships, want to return friends
    # so to get this to work, have to refresh on joins
    # x = Friendship.where(user_id: self.id).or(Friendship.where(friend_id: self.id))
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
