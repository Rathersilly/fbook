require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup

  end
  test "name present and length acceptable" do
  end
  test "email present and valid" do
  end
  test "password present and acceptable" do
  end
  test "users can befriend each other" do
    user1 = users(:user_1)
    user2 = users(:user_2)
    user1.befriend(user2)
    assert user1.active_friends.include?(user2)
    assert_not user1.passive_friends.include?(user2)
    assert user2.passive_friends.include?(user1)
    assert_not user2.active_friends.include?(user1)
    assert user1.friends.include?(user2)
    assert user2.friends.include?(user1)
  end
end

