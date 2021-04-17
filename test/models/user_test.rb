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
    user1.reload
    user2.reload
    assert user1.active_friends.include?(user2)
    assert user1.friends.include?(user2)
    assert_not user1.passive_friends.include?(user2)
    assert user2.passive_friends.include?(user1)
    assert_not user2.active_friends.include?(user1)
    assert user2.friends.include?(user1)
  end

  test "users can unfriend each other (active_friendship)" do
    user1 = users(:user_1)
    user2 = users(:user_2)
    user1.befriend(user2)
    user1.unfriend(user2)
    assert_not user1.active_friends.include?(user2)
    assert_not user1.passive_friends.include?(user2)
    assert_not user2.passive_friends.include?(user1)
    assert_not user2.active_friends.include?(user1)
    assert_not user1.friends.include?(user2)
    assert_not user2.friends.include?(user1)
  end

  test "users can unfriend each other (passive_friendship)" do
    user1 = users(:user_1)
    user2 = users(:user_2)
    assert user1.friends.count == 0
    assert user1.active_friends.count == 0
    assert user1.passive_friends.count == 0
    assert user2.friends.count == 0
    assert user2.active_friends.count == 0
    assert user2.passive_friends.count == 0
    user1.befriend(user2)
    user1.reload
    user2.reload
    assert user1.friends.count == 1
    assert user1.active_friends.count == 1
    assert user1.passive_friends.count == 0
    assert user2.friends.count == 1
    assert user2.active_friends.count == 0
    assert user2.passive_friends.count == 1
    user2.unfriend(user1)
    user1.reload
    user2.reload
    assert user1.friends.count == 0
    assert user1.active_friends.count == 0
    assert user1.passive_friends.count == 0
    assert user2.friends.count == 0
    assert user2.active_friends.count == 0
    assert user2.passive_friends.count == 0
    assert_not user1.active_friends.include?(user2)
    assert_not user1.passive_friends.include?(user2)
    assert_not user2.passive_friends.include?(user1)
    assert_not user2.active_friends.include?(user1)
    assert_not user1.friends.include?(user2)
    assert_not user2.friends.include?(user1)
  end

end

