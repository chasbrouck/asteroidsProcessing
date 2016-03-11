class Bullet  
//  bullet class
{
  float x;
  float y;
  float z;
 
  PVector  bulletSpd = new PVector();
 
  Bullet(PVector pos1, PVector spd1, int move)
  {  
    x = pos1.x;
    y = pos1.y;
    z = move;
 
    bulletSpd =   spd1.get();
 
    // bullets.add(new Bullet(playerPos, bulletSpd));  // ???????????
  }
 
  void display()
  {
    stroke(255);
    fill(255, 255, 255);
    ellipse(x, y, 5, 5);
  }
 
  void move()
  { 
    if (z == 1)
    {
      x += bulletSpd.x;
      y += bulletSpd.y;
    }
  }
  //
} // class
 
// ===============================================
 
 
void moveAll()
{
  for (Bullet temp : bullets)
  { 
    temp.move();
  }
}
 
void displayAll()
{
  for (Bullet temp : bullets)
  {
    temp.display();
  }
}
void fire(){
   PVector bulletSpd = new PVector();
    bulletSpd.set(3, 0);
    //bulletSpd.sub(position);
    bulletSpd.normalize();
    bulletSpd.mult(5);
 
    PVector positionbullet = new PVector();
 
   //where bullets start from
    positionbullet.x = -(1) * cos ((accel.x)) + location.x;
    positionbullet.y = -(1) * sin ((accel.y)) + location.y;
 
   //bullet direction

    bulletSpd.x = - (1) * cos ((direction+1.55)) + positionbullet.x;
    bulletSpd.y = - (1) * sin ((direction+1.55)) + positionbullet.y;
 
 
    bulletSpd.sub(positionbullet);
 
    //bulletSpd = positionbullet.get(); 
    bulletSpd.normalize();
    bulletSpd.mult(5);
    
    bullets.add( new Bullet(positionbullet, bulletSpd, 1) );
}

void fireRate(){
  if (bulletCount > 0)
  {
    bulletCount = bulletCount -1;
  }
}