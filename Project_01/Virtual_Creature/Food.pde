class Food {
  
  PVector position;
  float sizeVal;
  boolean alive = true;
  int numberOfDevils;
  PImage food;
  int dim;
 
  
  
  
  Food(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(20,20);
  }
  
  void update() {
    // TODO
  }
  
  void draw() {
    if (alive) {
      
      ellipseMode(CENTER);
      noStroke();
      //stroke(#00c2ff);
      fill(#ff0000);
      rect( position.x, position.y, sizeVal, sizeVal);
    
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}
