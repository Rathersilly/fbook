require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # ok it seems like session variable is not accessible in tests without
  # some black magic and a ton of googling =\
  #
  # workaround is the log_in_as function in test_helper.rb
  # https://stackoverflow.com/questions/44461101/accessing-session-in-integration-test
  # also checkout rails tutorial sampleapp - its working there
  def setup
    @user = users(:asdf)
  end
    
  test "should get new" do
    #get login_url
    #assert_response :success
  end
  test "should log user in" do
    # this will throw error - undefined method 'session' for nil::NilClass
    # assert_not logged_in?
    log_in_as(@user)
    p current_user
    
    assert logged_in?
    #log_in(@user)
    assert current_user == @user
  end

  test "should log out" do
    log_in_as(@user)
    log_out
    assert_not logged_in?
    assert current_user.nil?
  end


end
