# README

Odin demanded that I create a facebook clone and who am I to refuse?


Notes:
4/17/21 update:
it seems my reload callback in Fship model works, just not in model test.
 
4/16/21 update:
spent forever trying to fix a bug in making users recognize their friends
(esp the active_friendship and active_friend relations, immediately after
making a new friend)

IT TURNED OUT that reloading the user made things work fine, and i had the 
associations set up correctly.

the friend functions all work now, but require reloading of the user.
BUT the callback to do so i put in the Friendship class doesnt seem to do the trick

if i manually reload the users after making them friends in user_test.rb, 
the tests pass

could still make the relations into functions, not sure if that would be
better or worse
