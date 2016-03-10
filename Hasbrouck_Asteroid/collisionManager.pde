float lastX = 0;
float lastY = 0;

void collide() {
        //if the x or y of either circle is less that the radius of the circle
        // a collision has occured 
   for( Asteroid asteroidCheck : asteroids)
   {
     if((dist(asteroidCheck.x, asteroidCheck.y, location.x, location.y) < 40 + shipHit.r) && immunity == 0)
     {
       lives--;
       immunity = 100;
       location.x = width/2;
       location.y = height/2;
     }
   }
   for( Asteroid asteroidCheck : asteroids2)
   {
     if((dist(asteroidCheck.x, asteroidCheck.y, location.x, location.y) < 30 + shipHit.r) && immunity == 0)
     {
       lives--;
       immunity = 100;
       location.x = width/2;
       location.y = height/2;
     }
   }
   for( Asteroid asteroidCheck : asteroids3)
   {
     if((dist(asteroidCheck.x, asteroidCheck.y, location.x, location.y) < 20 + shipHit.r) && immunity == 0)
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
       if(dist(asteroidCheck.x, asteroidCheck.y, bulletCheck.x, bulletCheck.y) < 40)
       {
         lastX = asteroidCheck.x;
         lastY = asteroidCheck.y;
         asteroidCheck.z = 0;
         asteroidCheck.z2 = 0;
         asteroidCheck.x = -1500;
         asteroidCheck.y = -1500;
         bulletCheck.z = 0;
         bulletCheck.x = 1500;
         bulletCheck.y = 1500;
         score++;
         
        
         distanceAsteroid2();
         distanceAsteroid2();
         
           
       }
     }
     for( Asteroid asteroidCheck : asteroids2)
     {
       if(dist(asteroidCheck.x, asteroidCheck.y, bulletCheck.x, bulletCheck.y) < 30)
       {
         lastX = asteroidCheck.x;
         lastY = asteroidCheck.y;
         asteroidCheck.z = 0;
         asteroidCheck.z2 = 0;
         asteroidCheck.x = -1500;
         asteroidCheck.y = -1500;
         bulletCheck.z = 0;
         bulletCheck.x = 1500;
         bulletCheck.y = 1500;
         score++;
         
         distanceAsteroid3();
         distanceAsteroid3();
       }
     }
     for( Asteroid asteroidCheck : asteroids3)
     {
       if(dist(asteroidCheck.x, asteroidCheck.y, bulletCheck.x, bulletCheck.y) < 25)
       {
         lastX = asteroidCheck.x;
         lastY = asteroidCheck.y;
         asteroidCheck.z = 0;
         asteroidCheck.z2 = 0;
         asteroidCheck.x = -1500;
         asteroidCheck.y = -1500;
         bulletCheck.z = 0;
         bulletCheck.x = 1500;
         bulletCheck.y = 1500;
         score++;
         
       }
     }
   }
}