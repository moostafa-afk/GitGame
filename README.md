I need to test the shader mixer to see if the code I've fixed up actually works, if it does Ill add it to the laser beam, then as said yesterday, I will animate both the sprite and shape cast by using the scale. from 0 to 4 sounds right

Then animate the squash

Something as simple as animating a line2d is stressing me out due to me using two animation player which seems like a big mistake

Ok now I fixed the problem for the animation, I didn't even need to use the squash function, all I needed to do was have two animation players, and both should should auto play added, the first one would be the normal scale for the parent sprite , and the second would be the scale of the laser beam, itself `aka line2d` , but the timing will be from 0 to .1 so that it would loop much faster.




## Ok now what do I have to do:
- [x] I need to make the laser beam deal damage and knockback

- [ ] It does deal damage, I just used the script that I made to the  laser script, so I may have to do redo that one to make a more uniform one.

 - [x] With or without knockback for some reason the player is stuck in the laser beam
 
   *The solution was to make change a line of code responsible for allocating velocity to knockback.*

- [ ]  Now I have to decide what should happen if the laser hits the player
     
It can 
- Push the player and or limit or slow movement like before.
- The player can fly off sending him far away.

 - [ ]  l'll also need to find a way to make the script figure out any hurtbox not just the player's hurtbox.

 - [ ]  And Ill need to make  a damaged state for the player

 - [ ]  And an animation when damaged

 - [ ]  And might need to make a stun parameter 
