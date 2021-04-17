class Friendship < ApplicationRecord
  belongs_to :user, inverse_of: :active_friendships
  belongs_to :friend, class_name: "User", inverse_of: :passive_friendships

  after_commit :reload_users
  def self.flog
      @@flog ||= Logger.new("#{Rails.root}/log/friendlog.log")
      @@flog
  end
  
  private
  # user and friend must be reloaded for the friends associations to be recognized.
  # i tried this as an after_commit  callback in Friendship model but didnt work
  # NEVERMIND it seems to work just not in tests - in tests we're reloading manually
  def reload_users
    a = User.find(friend_id).reload
    b = User.find(user_id).reload
    puts "RELOADED"
    pp a
    pp b
    puts"a friends (#{a.friends.count})".green
    a.friends.each {|f| puts f.name}
    puts"b friends (#{b.friends.count})".green
    b.friends.each {|f| puts f.name}
  end
end
