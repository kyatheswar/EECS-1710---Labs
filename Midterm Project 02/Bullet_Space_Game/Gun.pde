abstract class Gun {
 
  float cooldown, threshold;
  
  Gun() {
    
  }
  
  void shoot(){
    if (cooldown == threshold) {
     engine.add(new Bullet());
     cooldown = 0;
     
    }
  }
  void recharge() {
   if (cooldown < threshold) {
     cooldown = cooldown +1;
   }
  }

void displayBar() {
  
  stroke(255);
  strokeWeight(2);
  fill( 255, 0, 0);
  rect(200, 100, 100, 20);
  strokeWeight(0);
  
  fill(0, 255, 0);
  rect(200, 100, map(cooldown, 0, threshold, 0, 100),20);
}

void displayArc() {
 float angle  = map (cooldown, 0, threshold, 0, TWO_PI);
 arc(myShip.x, myShip.y,100,100,0, angle);
 fill(0);
 ellipse(myShip.x, myShip.y,95,95);

  
  
}

}
