void collide() {
        //if the x or y of either circle is less that the radius of the circle
        // a collision has occured 
   for( Asteroid asteroidCheck : asteroids)
   {
     if((dist(asteroidCheck.x, asteroidCheck.y, location.x, location.y) < 25 + shipHit.r) && immunity == 0)
     {
       lives--;
       immunity = 100;
       location.x = width/2;
       location.y = height/2;
     }
   }
}

void immunityDecay() {
  if (immunity > 0)
  {
    immunity = immunity -1;
  }
}

//bullet collision
void boom(){
  for( Bullet bulletCheck : bullets)
   {
     for( Asteroid asteroidCheck : asteroids)
     {
       if(dist(asteroidCheck.x, asteroidCheck.y, bulletCheck.x, bulletCheck.y) < 30)
       {
         bulletCheck.x = 1500;
         bulletCheck.y = 1500;
         score++;
       }
     }
   }
}