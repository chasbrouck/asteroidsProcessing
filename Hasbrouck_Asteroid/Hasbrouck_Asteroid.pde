//game variables
float lives = 3;// number of lives
int score = 0;

//ship variables
PImage trump1; // asteroid 1
PImage trump2; // asteroid 2
PImage bernie; // ship image
float direction;//ships direction
PVector location;//transformation location
PVector velocity;//ships speeds
PVector accel;//ships acceleration

//variable for asteroid
float[] a = new float[5];
float[] b = new float[5];
int i = 0;

ArrayList <Asteroid> asteroids; 

//bullets array
ArrayList <Bullet> bullets; 
float bulletCount = 0;

//array for asteroids creation and ship hitbox
hitBox[] asteroid = new hitBox[5];
hitBox shipHit = new hitBox(0,0,25);

void setup() {
  //size of area
  size(800, 500);
  //color and stroke of hitbox
  stroke(255);
  strokeWeight(5);
  
  //create asteroids
  while(i < 5) { 
    //place randoms into an array to store for later
    a[i] = random(0, width);
    b[i] = random(0, height);
    i = i + 1;
  }
  
  trump1 = loadImage("trump1.png");
  bernie = loadImage("bernie.png");
  bullets = new ArrayList();
  asteroids = new ArrayList();
  location = new PVector(width/2, height/2, 0);
  velocity = new PVector();
  accel = new PVector();
}
 

void draw() {
 
  //check each frame for user unput
  input();
 
 //if you still haves lives play
 if ( lives > 0) {
     //backgrount color
      background(#262626);
      //fire rate control
      fireRate();
      //draw asteroids
      trump();
      //check shipe collide
      collide();
      //check bullet collide
      boom();
      //move ship variable
      velocity.add(accel);
      location.add(velocity);
       accel.set(0, 0, 0);
      //move and display cullet
      moveAll();
      displayAll();
      AmoveAll();
      AdisplayAll();
      //draw ship
      ship();
   
      
      if (velocity.mag() != 0) velocity.mult(0.99);
     
      //screen boundaries 
      if (location.x<0) {
        location.x = location.x+width;
      }
       if (location.x>width) {
          location.x = 0;
        }
        if (location.y<0) {
          location.y = location.y+height;
        }
        if (location.y>height) {
          location.y = 0;
        }
 }
 //lose condition
 else {
   background(#262626);
   textSize(50);
   text("Score: " + score, (width/2)-200, height/2);
   
 }
}
 
//draw ship 
void ship() {
  pushMatrix();
    // points origin of rotation to center of the ship
    translate(location.x, location.y); 
    // ship rotation = direction
    rotate(direction); 
    // Display the ship & hit box  
    shipHit.render();  
    image(bernie, -trump1.width/24, -trump1.height/24, 50, 52);    
   popMatrix(); 
}

//input for movement and fire
void input() { 
  // spin ship left
   if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      direction-=0.1;
    }
    //spin ship right
    if (keyCode == RIGHT) {
      direction+=0.1;
    }
    //accelerate ship
    if (keyCode == UP) {
      float totalAccel = 0.2;                 // how much ship accelerates
      accel.x = totalAccel * sin(direction);  // total accel
      accel.y = -totalAccel * cos(direction); // total accel
    }
    if (keyCode == SHIFT && bulletCount == 0) {
      fire();  
      Afire();
      bulletCount = 20;
      
    }
   }
}

//draw asteroid method
void trump(){
  int i = 0;
      while(i < 5) {
        asteroid[i] = new hitBox(a[i],b[i],23);
        if(b[i] > height){
          b[i] = 0;
        }
        if(a[i] < 0) {
          a[i] = width;
        }
        asteroid[i].render();
        image(trump1, a[i]-25, b[i]-24, 50, 50);
        i = i + 1;;
      }
}