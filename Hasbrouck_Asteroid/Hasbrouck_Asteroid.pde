//game variables
int lives = 4;// number of lives
int score = 0;// score
float immunity = 100; // variable for post-death immunity 

//ship variables
PImage trump1; // asteroid 1
PImage trump2; // asteroid 2
PImage trump3; // asteroid 3
PImage ship; // ship image
PImage bernie; // bernie image
PImage hillary; // hillar image 
float direction;//ships direction
PVector location;//transformation location
PVector velocity;//ships speeds
PVector accel;//ships acceleration

//variable for asteroid
int i = 0;
int s= 0;

//array Lists for 3 levels of asteroids
ArrayList <Asteroid> asteroids; 
ArrayList <Asteroid> asteroids2; 
ArrayList <Asteroid> asteroids3; 

//array list for bullets and Bullet Count to control rate of fire 
ArrayList <Bullet> bullets; 
float bulletCount = 0;

//array for asteroids creation and ship hitbox
hitBox shipHit = new hitBox(0,0,25);

void setup() {
  //size of area
  size(800, 500);
  
  //load images for ship/astroid variants
  trump1 = loadImage("trump1.png");
  trump2 = loadImage("trump2v.png");
  trump3 = loadImage("trump3.png");
  bernie = loadImage("bernie.png");
  hillary = loadImage("clinton.png");
  
  //array list for bullets and astroid variants
  bullets = new ArrayList();
  asteroids = new ArrayList();
  asteroids2 = new ArrayList();
  asteroids3 = new ArrayList();
  
  //location, speed and accel vectors for ship
  location = new PVector(width/2, height/2, 0);
  velocity = new PVector();
  accel = new PVector();
  
  //generate 3 initial astroids
  while (s < 3)
  {
    distanceAsteroid();
    s++;
  }
}
 

void draw() {
 
  //check each frame for user unput
  input();
 
 //choose player game state
 if (lives == 4)
 {
   //UI of game state 
   background(#3385ff);
   image(bernie, 100, 200, 200, 200); 
   image(hillary, 500, 200, 200, 200); 
   textSize(50);
   text("Choose Your Candidate", (width/2)-275, 125);
   
  //choose candidate based on mouseX on click 
  if(mousePressed ==true)
  {
    if(mouseX < width/2)
    {
      ship = bernie;
      lives = 3;
    }
    if(mouseX > width/2)
    {
      ship = hillary;
      lives = 3;
    }
  }
  
 }
 //play game state
 if( lives > 0 && lives < 4) {
   
      background(#3385ff);
        
      fireRate(); //fire rate control
      immunityDecay(); //post death immunity timer
      collide();  // check ship & astroid collision
      boom(); // check astroid and bullet collision
      moveAll(); // move bullet
      displayAll(); // display bullets
      moveAsteroid();// move bullet
      displayAsteroid();// display astroids
      ship(); // draw & move ship
       
      //scoring and lives 
      textSize(20);
      fill(255);
      text("Lives: " + lives, 25, 30);
      text("Score: " + score, 25, 60);
      
     //screen boundaries for ship
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
 
 //lose game state
 if (lives < 1 || score ==39) {
   
   //UI elements
   background(#ff4d4d);
   textSize(50);
   fill(255);
   text("Trumps Destroyed: "+score, (width/2)-265, 100);
   image(trump2, 300, 200, 200, 200); 
   
 }
}
 
//draw ship 
void ship() {
  
  //variables for direction and speed
  velocity.add(accel);
  location.add(velocity);
  accel.set(0, 0, 0);
  if (velocity.mag() != 0) velocity.mult(0.99);
  
  //translates
  pushMatrix();
  
    // points origin of rotation to center of the ship
    translate(location.x, location.y); 
    
    // ship rotation 
    rotate(direction); 
    
    // set hit box for ship & draw ship image 
    shipHit.render();  
    image(ship, -trump1.width/24, -trump1.height/24, 50, 52);    
    
   popMatrix(); 
}

//input for movement and fire
void input() { 
  // spin ship left
   if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      direction-=0.1;
    }
    // spin ship right
    if (keyCode == RIGHT) {
      direction+=0.1;
    }
    // accelerate ship
    if (keyCode == UP) {
      float totalAccel = 0.2;                 // how much ship accelerates
      accel.x = totalAccel * sin(direction);  // total accel
      accel.y = -totalAccel * cos(direction); // total accel
    }
    // fire bullet
    if (keyCode == SHIFT && bulletCount == 0) {
      fire();  
      bulletCount = 20;
    }
   }
}