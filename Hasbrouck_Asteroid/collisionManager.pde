//hold x&y of destroyed astroid for next tier generation
float lastX = 0;
float lastY = 0;

//collide function for ship & asteroid
void collide() {
  
  //for each astroid object in asteroids array list
   for( Asteroid asteroidCheck : asteroids)
   {
     //if distance is less than radius than a collision occurs
     if((dist(asteroidCheck.x, asteroidCheck.y, location.x, location.y) < 40 + shipHit.r) && immunity == 0)
     {
       //subtract life, grant temporary immunity and center ship
       lives--;
       immunity = 100;
       location.x = width/2;
       location.y = height/2;
     }
   }
   //for each astroid object in asteroids2 array list
   for( Asteroid asteroidCheck : asteroids2)
   { 
     //if distance is less than radius than a collision occurs
     if((dist(asteroidCheck.x, asteroidCheck.y, location.x, location.y) < 30 + shipHit.r) && immunity == 0)
     {
       //subtract life, grant temporary immunity and center ship
       lives--;
       immunity = 100;
       location.x = width/2;
       location.y = height/2;
     }
   }
   //for each astroid object in asteroids3 array list
   for( Asteroid asteroidCheck : asteroids3)
   { 
     //if distance is less than radius than a collision occurs
     if((dist(asteroidCheck.x, asteroidCheck.y, location.x, location.y) < 20 + shipHit.r) && immunity == 0)
     {
       //subtract life, grant temporary immunity and center ship
       lives--;
       immunity = 100;
       location.x = width/2;
       location.y = height/2;
     }
   }
}

//method for temporary immunity decay
void immunityDecay() {
  if (immunity > 0)
  {
    immunity = immunity -1;
  }
}

//function for bullet and asteroid collision
void boom(){
  //for each bullet object in bullet array list
  for( Bullet bulletCheck : bullets)
   {
     //for each astroid object in asteroids array list
     for( Asteroid asteroidCheck : asteroids)
     {
       //if distance is less than radius than a collision occurs
       if(dist(asteroidCheck.x, asteroidCheck.y, bulletCheck.x, bulletCheck.y) < 40)
       {
         //save x and y for next tier astroid generation
         lastX = asteroidCheck.x;
         lastY = asteroidCheck.y;
         
         //remove astroid/bullet from play feild and stop them from moving
         asteroidCheck.z = 0;
         asteroidCheck.z2 = 0;
         asteroidCheck.x = -1500;
         asteroidCheck.y = -1500;
         bulletCheck.z = 0;
         bulletCheck.x = 1500;
         bulletCheck.y = 1500;
         
         //add to score
         score++;
         
        //create three next tier astroids
         distanceAsteroid2();
         distanceAsteroid2();
         distanceAsteroid2();
         
       }
     }
     //for each astroid object in asteroids2 array list
     for( Asteroid asteroidCheck : asteroids2)
     {
       //if distance is less than radius than a collision occurs
       if(dist(asteroidCheck.x, asteroidCheck.y, bulletCheck.x, bulletCheck.y) < 30)
       {
         //save x and y for next tier astroid generation
         lastX = asteroidCheck.x;
         lastY = asteroidCheck.y;
         
         //remove astroid/bullet from play feild and stop them from moving
         asteroidCheck.z = 0;
         asteroidCheck.z2 = 0;
         asteroidCheck.x = -1500;
         asteroidCheck.y = -1500;
         bulletCheck.z = 0;
         bulletCheck.x = 1500;
         bulletCheck.y = 1500;
         
         //add to score
         score++;
         
         //create three next tier astroids
         distanceAsteroid3();
         distanceAsteroid3();
         distanceAsteroid3();
       }
     }
     //for each astroid object in asteroids3 array list
     for( Asteroid asteroidCheck : asteroids3)
     {
       if(dist(asteroidCheck.x, asteroidCheck.y, bulletCheck.x, bulletCheck.y) < 25)
       {
         //save x and y for next tier astroid generation
         lastX = asteroidCheck.x;
         lastY = asteroidCheck.y;
         
         //remove astroid/bullet from play feild and stop them from moving
         asteroidCheck.z = 0;
         asteroidCheck.z2 = 0;
         asteroidCheck.x = -1500;
         asteroidCheck.y = -1500;
         bulletCheck.z = 0;
         bulletCheck.x = 1500;
         bulletCheck.y = 1500;
         
         //add to score
         score++;
         
       }
     }
   }
}