require "test_helper"
module Minitest::Assertions
  def assert_friends(user1,user2)
    assert user1.active_friends.include?(user2)
    assert user1.friends.include?(user2)
    assert_not user1.passive_friends.include?(user2)
    assert user2.passive_friends.include?(user1)
    assert_not user2.active_friends.include?(user1)
    assert user2.friends.include?(user1)
    assert_not user1.friends.count == 0
  end
  def assert_not_friends(user1,user2)
    assert_not user1.active_friends.include?(user2)
    assert_not user1.passive_friends.include?(user2)
    assert_not user2.passive_friends.include?(user1)
    assert_not user2.active_friends.include?(user1)
    assert_not user1.friends.include?(user2)
    assert_not user2.friends.include?(user1)
  end
end

class UserTest < ActiveSupport::TestCase
  def setup
    user1 = users(:user_1)
    user2 = users(:user_2)

  end

  test "name present and length acceptable" do
  end
  test "email present and valid" do
  end
  test "password present and acceptable" do
  end
  test "users can befriend each other" do
    assert_not_friends(user1,user2)
    user1.befriend(user2)
    # there is a callback in friendship model to reload,
    # but it doesnt work in tests
    user1.reload
    user2.reload
    assert_friends(user1,user2)
  end

  test "users can unfriend each other (active_friendship)" do
    user1.befriend(user2)
    user1.unfriend(user2)
    assert_not_friends(user1,user2)
    assert_equal user1.friends.count, 0
    assert_equal user2.friends.count, 0
  end

  test "users can unfriend each other (passive_friendship)" do
    user1.befriend(user2)
    user1.reload
    user2.reload
    user2.unfriend(user1)
    user1.reload
    user2.reload
    assert_not_friends(user1,user2)
    assert_equal user1.friends.count, 0
    assert_equal user2.friends.count, 0
  end

end

