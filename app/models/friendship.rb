class Friendship < ApplicationRecord
  belongs_to :user, inverse_of: :active_friendships
  belongs_to :friend, class_name: "User", inverse_of: :passive_friendships

  after_commit :reload_users
  def self.flog
      @@flog ||= Logger.new("#{Rails.root}/log/friendlog.log")
      @@flog
  end
  
  private
  def reload_users
    a = User.find(friend_id).reload
    b = User.find(user_id).reload
    puts "RELOADED"
    pp a
    pp b
  end
end
