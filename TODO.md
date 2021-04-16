#TODO

in shared/_error_messages, button doesn't currently do anything

when you test for a method that is missing (eg in a helper when you
havent include that helper module in test), a wall of red text appears.
the first line of it tells you what method is missing, and theres probably
an easy way to grab just that line and not display the red wall
:wa

the users#add_friend method and the befriend helper method both do the same thing
they should probably be refactored for dryness
pretty sure it should be in controller, not model - actually idk

should refresh how to log stuff - puts is nice for immediate debug feedback
but isnt permanent

