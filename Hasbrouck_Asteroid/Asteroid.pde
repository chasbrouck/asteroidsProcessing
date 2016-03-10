class Asteroid  
//  bullet class
{
  float x;
  float y;
 
  PVector  asteroidSpd = new PVector();
 
  Asteroid(PVector pos1, PVector spd1)
  {  
    x = pos1.x;
    y = pos1.y;
 
    asteroidSpd =   spd1.get();
 
    // bullets.add(new Bullet(playerPos, bulletSpd));  // ???????????
  }
 
  void display()
  {
    fill(255, 255, 255);
    ellipse(x, y, 25, 25);
  }
 
  void move()
  {
    x += asteroidSpd.x;
    y += asteroidSpd.y;
  }
  //
} // class
 
// ===============================================
 
 
void AmoveAll()
{
  for (Asteroid temp : asteroids)
  { 
    temp.move();
  }
}
 
void AdisplayAll()
{
  for (Asteroid temp : asteroids)
  {
    temp.display();
  }
}
void Afire(){
   PVector asteroidSpd = new PVector();
    asteroidSpd.set(3, 0);
    //bulletSpd.sub(position);
    asteroidSpd.normalize();
    asteroidSpd.mult(5);
 
    PVector asteroidPosition = new PVector();
 
   //where bullets start from
    asteroidPosition.x = -(1) * cos ((accel.x)) + location.x;
    asteroidPosition.y = -(1) * sin ((accel.y)) + location.y;
 
   //bullet direction
    asteroidSpd.x = - (1) * cos ((direction+20)) + asteroidPosition.x;
    asteroidSpd.y = - (1) * sin ((direction+20)) + asteroidPosition.y;
 
 
    asteroidSpd.sub(asteroidPosition);
 
    //bulletSpd = positionbullet.get(); 
    asteroidSpd.normalize();
    asteroidSpd.mult(5);
    
    asteroids.add( new Asteroid(asteroidPosition, asteroidSpd) );
}