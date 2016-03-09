void collide() {
        //if the x or y of either circle is less that the radius of the circle
        // a collision has occured 
   for(i = 0; i<5; i++){
    if(dist(asteroid[i].x, asteroid[i].y, location.x, location.y) < asteroid[i].r + shipHit.r) {
          lives--;
     }
   } 
}


//bullet collision
void boom(){
  for( Bullet bulletCheck : bullets)
   {
     for(i = 0; i<5; i++){
      if(dist(asteroid[i].x, asteroid[i].y, bulletCheck.x, bulletCheck.y) < asteroid[i].r + (shipHit.r-25)) {
        //make asteroid dissapear on hit
        a[i] = 1500;
        b[i] = 1500; 
        bulletCheck.x =-1500;
        bulletCheck.y =-1500;

        //score up on hit
        score++;          
       }
     } 
   }
}