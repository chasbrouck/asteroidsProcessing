class Bullet  
{
  //x,y and active variables
  float x;
  float y;
  float z;
 
   //vector for bullet
  PVector  bulletSpd = new PVector();
 
 //constructor for bullet
  Bullet(PVector pos1, PVector spd1, int move)
  {  
    x = pos1.x;
    y = pos1.y;
    z = move;
 
    bulletSpd =   spd1.get();
 
  }
 
 //draw bullet
  void display()
  {
    stroke(255);
    strokeWeight(5);
    fill(255, 255, 255);
    ellipse(x, y, 5, 5);
  }
 
 //move bullet
  void move()
  { 
    //condition for bullet movement
    if (z == 1)
    {
      x += bulletSpd.x;
      y += bulletSpd.y;
    }
  }
} 

//move all bullet
void moveAll()
{
  for (Bullet temp : bullets)
  { 
    temp.move();
  }
}

//display all bullet
void displayAll()
{
  for (Bullet temp : bullets)
  {
    temp.display();
  }
}

//fire function on button press
void fire(){
  
  //vector for bulelt speed 
   PVector bulletSpd = new PVector();
    bulletSpd.set(3, 0);
    bulletSpd.normalize();
    bulletSpd.mult(5);
 
 //vector for bullet direction
    PVector positionbullet = new PVector();
 
   //bullet starting location
    positionbullet.x = -(1) * cos ((accel.x)) + location.x;
    positionbullet.y = -(1) * sin ((accel.y)) + location.y;
 
   //bullet fire direction
    bulletSpd.x = - (1) * cos ((direction+1.55)) + positionbullet.x;
    bulletSpd.y = - (1) * sin ((direction+1.55)) + positionbullet.y;
 
 
    bulletSpd.sub(positionbullet);
    bulletSpd.normalize();
    bulletSpd.mult(5);
    
    //add bullet to array list
    bullets.add( new Bullet(positionbullet, bulletSpd, 1) );
}

//controls fire rate
void fireRate(){
  if (bulletCount > 0)
  {
    bulletCount = bulletCount -1;
  }
}