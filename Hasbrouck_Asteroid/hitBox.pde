class hitBox {
   
  //x,y and radius variables of ship hitBox
    float x;
    float y;
    float r;
 
 //constructor for ship hitbo
    hitBox(float xpos, float ypos, float radius) {
        x = xpos;
        y = ypos;
        r = radius;  
    }
     
     // draw ship hit box
    void render() {    
        ellipse(x,y,r*2, r*2);
    }    
}