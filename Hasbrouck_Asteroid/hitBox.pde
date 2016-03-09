class hitBox {
   
  //x & y position of circle  
    float x;
    float y;
  //radius of circle 
    float r;
 
 //constructor for circle
    hitBox(float xpos, float ypos, float radius) {
        x = xpos;
        y = ypos;
        r = radius;  
    }
     
     // constructor to draw circles in each i=teration
    void render() {    
        ellipse(x,y,r*2, r*2);
    }            
}