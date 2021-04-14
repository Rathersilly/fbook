class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def self.flog
      @@flog ||= Logger.new("#{Rails.root}/log/friendlog.log")
      @@flog
  end
end
