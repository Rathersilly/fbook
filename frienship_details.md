Specs/problems with the Friendship model

specs:
user can befriend another user - this creates a Friendship

#there should be only one Friendship between two users.
ie if Friendship with user_id: 1, friend_id: 2
there should be no
      Friendship with user_id: 2, friend_id: 1
can check for this in befriend/unfriend functions
should probably report if there's already a friendship, as that indicates
a problem of what is being shown to users
can also add script to check(confirm) that such relationships don't exist

should add a certain log file for such things.
https://stackoverflow.com/questions/337739/how-to-log-something-in-rails-in-an-independent-log-file
each namespace could have its own log and it gets logged to the right place
or just have one custom log for starters?




unfriending: removing one side of friendships should remove otherside
ways  - manually get each side and delete
      - arrange some sort of dependent: destroy relationship
      - callbacks?
      
I think relationships need a primary key?
also add checks that friendships arent created twice

Actually, remember that when befriending someone, all that is created is a Friendship
- the active/passive part is done by rails, is not in database. so to unfriend, just 
have to find the ONE Friendship that relates the 2 users, destroy it, and voila?

trying to destroy friendship, which has no primary id:
destroying friendship errors
(the correct friendship was found, just cant be destroyed):
r = Friendship.where(friend_id: 2).destroy      -> wrong # args - expected 1, got 0
r = Friendship.where(friend_id: 2).destroy_all  -> PG::SyntaxError - zero-length delimited
                                                  identifier at or near """"






