class AddIdToFriendship < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :id, :primary_key
  end
end
