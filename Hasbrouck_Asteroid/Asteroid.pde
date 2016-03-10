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
    ellipse(x, y, 80, 80);
    image(trump1, x-40, y-40, 80, 80);
  }
  
  void display2()
  {
    fill(255, 255, 255);
    ellipse(x, y, 60, 60);
    image(trump2, x-30, y-30, 60, 60);
  }
  void display3()
  {
    fill(255, 255, 255);
    ellipse(x, y, 40, 40);
    image(trump3, x-20, y-20, 40, 40);
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
  for (Asteroid temp : asteroids2)
  { 
    temp.move();
  }
  for (Asteroid temp : asteroids3)
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
  for (Asteroid temp : asteroids2)
  {
    temp.display2();
  }
  for (Asteroid temp : asteroids3)
  {
    temp.display3();
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
void distanceAsteroid2(){
   PVector asteroidSpd = new PVector();
   float r = random(-10, 90);
   float x = lastX;
   float y = lastY;
    asteroidSpd.set(1, 0);
    //bulletSpd.sub(position);
    asteroidSpd.normalize();
    asteroidSpd.mult(5);
 
    PVector asteroidPosition = new PVector();
 
   //asteroid
    asteroidPosition.x = x;
    asteroidPosition.y = y;
 
   //bullet direction
    asteroidSpd.x = - (1) * cos ((r)) + asteroidPosition.x;
    asteroidSpd.y = - (1) * sin ((r)) + asteroidPosition.y;
 
 
    asteroidSpd.sub(asteroidPosition);
 
    //bulletSpd = asteroidPosition.get(); 
    asteroidSpd.normalize();
    asteroidSpd.mult(2);
    
    asteroids2.add( new Asteroid(asteroidPosition, asteroidSpd, 1,1) );
    
}
void distanceAsteroid3(){
   PVector asteroidSpd = new PVector();
   float r = random(-10, 90);
   float x = lastX;
   float y = lastY;
    asteroidSpd.set(1, 0);
    //bulletSpd.sub(position);
    asteroidSpd.normalize();
    asteroidSpd.mult(5);
 
    PVector asteroidPosition = new PVector();
 
   //asteroid
    asteroidPosition.x = x;
    asteroidPosition.y = y;
 
   //bullet direction
    asteroidSpd.x = - (1) * cos ((r)) + asteroidPosition.x;
    asteroidSpd.y = - (1) * sin ((r)) + asteroidPosition.y;
 
 
    asteroidSpd.sub(asteroidPosition);
 
    //bulletSpd = asteroidPosition.get(); 
    asteroidSpd.normalize();
    asteroidSpd.mult(2);
    
    asteroids3.add( new Asteroid(asteroidPosition, asteroidSpd, 1,1) );
    
}