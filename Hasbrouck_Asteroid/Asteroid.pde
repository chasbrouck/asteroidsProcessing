class Asteroid  
//  bullet class
{
  float x;
  float y;
  int z;
  int z2;
 
  PVector  asteroidSpd = new PVector();
 
  Asteroid(PVector pos2, PVector spd2, int alive, int move)
  {  
    x = pos2.x;
    y = pos2.y;
    z = alive;
    z2 = move;
    asteroidSpd =   spd2.get();
 
  }
 
  void display()
  {
    fill(255, 255, 255);
    ellipse(x, y, 50, 50);
    image(trump1, x-25, y-25, 50, 50);
  }
 
  void move()
  {
    if ( z == 1)
    {
      x += asteroidSpd.x;
      y += asteroidSpd.y;
    }
    
    if ( z == 1)
      {
        if( x > width+20)
        {
          x=0;
        }
        if( x < -20)
        {
          x=width;
        }
        if( y > height+20)
        {
          y=0;
        }
        if( y < -20)
        {
          y=height;
        }
     }
  }

} // class
 
// ===============================================
 
 
void moveAsteroid()
{
  for (Asteroid temp : asteroids)
  { 
    temp.move();
  }
}
 
void displayAsteroid()
{
  for (Asteroid temp : asteroids)
  {
    temp.display();
  }
}
void distanceAsteroid(){
   PVector asteroidSpd = new PVector();
   float r = random(-10, 90);
   float x = random(0, width);
   float y = random(0, height);
    asteroidSpd.set(1, 0);
    //bulletSpd.sub(position);
    asteroidSpd.normalize();
    asteroidSpd.mult(5);
 
    PVector asteroidPosition = new PVector();
 
   //where bullets start from
    asteroidPosition.x = x;
    asteroidPosition.y = y;
 
   //bullet direction
    asteroidSpd.x = - (1) * cos ((r)) + asteroidPosition.x;
    asteroidSpd.y = - (1) * sin ((r)) + asteroidPosition.y;
 
 
    asteroidSpd.sub(asteroidPosition);
 
    //bulletSpd = asteroidPosition.get(); 
    asteroidSpd.normalize();
    asteroidSpd.mult(2);
    
    asteroids.add( new Asteroid(asteroidPosition, asteroidSpd, 1,1) );
    
}