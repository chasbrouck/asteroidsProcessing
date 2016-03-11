//asteroid class
class Asteroid  
{
  // x,y,active and wrap variables
  float x;
  float y;
  int z;
  int z2;
 
 //direction vector for asteroid
  PVector  asteroidSpd = new PVector();
 
 //astroid constructor
  Asteroid(PVector pos2, PVector spd2, int alive, int move)
  {  
    x = pos2.x;
    y = pos2.y;
    z = alive;
    z2 = move;
    asteroidSpd =   spd2.get();
  }
 
 // draw hitbox for asteroid and tier one astroid
  void display()
  {
    stroke(#3385ff, 0);
    fill(#3385ff, 0);
    ellipse(x, y, 80, 80);
    image(trump1, x-40, y-40, 80, 80);
  }
  
  // draw hitbox for asteroid and tier two astroid
  void display2()
  {
    stroke(#3385ff, 0);
    fill(#3385ff, 0);
    ellipse(x, y, 60, 60);
    image(trump2, x-30, y-30, 60, 60);
  }
  
  // draw hitbox for asteroid and tier three astroid
  void display3()
  {
    stroke(#3385ff, 0);
    fill(#3385ff, 0);
    ellipse(x, y, 40, 40);
    image(trump3, x-20, y-20, 40, 40);
  }
 
  
  //move conditions for asteroid 
  void move()
  {
    //move only when active 
    if ( z == 1)
    {
      x += asteroidSpd.x;
      y += asteroidSpd.y;
    }
    
    //astroid wrap around the screen
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

}

//move asteroid function manager 
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
 
//display asteroid function manager 
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

//draw function for tier one asteroid
void distanceAsteroid(){
  
  //vector for asteroid direction
   PVector asteroidSpd = new PVector();
   
   //random x,y and angle for astroid generation
   float r = random(-10, 90);
   float x = random(0, width);
   float y = random(0, height);
    asteroidSpd.set(1, 0);
    asteroidSpd.normalize();
    asteroidSpd.mult(5);
 
    PVector asteroidPosition = new PVector();
 
   //where astroid starts from
    asteroidPosition.x = x;
    asteroidPosition.y = y;
 
   //astroid direction
    asteroidSpd.x = - (1) * cos ((r)) + asteroidPosition.x;
    asteroidSpd.y = - (1) * sin ((r)) + asteroidPosition.y;
 
 
    asteroidSpd.sub(asteroidPosition);
    asteroidSpd.normalize();
    asteroidSpd.mult(2);
    
    //add to array list
    asteroids.add( new Asteroid(asteroidPosition, asteroidSpd, 1,1) );
    
}

//draw function for tier two asteroid
void distanceAsteroid2(){
  
   //vector for asteroid direction
   PVector asteroidSpd = new PVector();
   
   //random x,y and angle for astroid generation
   float r = random(-10, 90);
   float x = lastX;
   float y = lastY;
    asteroidSpd.set(1, 0);
    asteroidSpd.normalize();
    asteroidSpd.mult(5);
 
    PVector asteroidPosition = new PVector();
 
   //asteroid
    asteroidPosition.x = x;
    asteroidPosition.y = y;
 
   //astroid direction
    asteroidSpd.x = - (1) * cos ((r)) + asteroidPosition.x;
    asteroidSpd.y = - (1) * sin ((r)) + asteroidPosition.y;
 
 
    asteroidSpd.sub(asteroidPosition); 
    asteroidSpd.normalize();
    asteroidSpd.mult(2);
    
    //add to array list
    asteroids2.add( new Asteroid(asteroidPosition, asteroidSpd, 1,1) );
    
}

//draw function for tier three asteroid
void distanceAsteroid3(){
  
   //vector for asteroid direction
   PVector asteroidSpd = new PVector();
   
   //random x,y and angle for astroid generation
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
 
   //astroid direction
    asteroidSpd.x = - (1) * cos ((r)) + asteroidPosition.x;
    asteroidSpd.y = - (1) * sin ((r)) + asteroidPosition.y;
 
 
    asteroidSpd.sub(asteroidPosition);
    asteroidSpd.normalize();
    asteroidSpd.mult(2);
    
    //add to array list
    asteroids3.add( new Asteroid(asteroidPosition, asteroidSpd, 1,1) );
    
}