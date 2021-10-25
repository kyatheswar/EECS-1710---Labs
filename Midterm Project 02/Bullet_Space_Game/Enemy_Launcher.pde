class Enemy_Launcher extends GameObject {
  Enemy_Launcher() {
    x = width/2;
    y = -100;
    dx = 0;
    dy = 0;
  }

  void show() {
    fill(100);
    ellipse(x, y, 100, 100);
  }

  void act() {
 if (frameCount < 100){
  // do nothing 
 } else if (frameCount < 600) {
   straightLine(100);
 } else if (frameCount < 1100) {
   straightLine(400);
 } else if (frameCount< 1500) {
   randomWave();
 }
  }
  
  void straightLine(float incomingX) {
    
    x = incomingX;
    if (frameCount % 100 == 0) {
     engine.add(new Enemy(x,y)); 
    }
  }
  
  void randomWave() {
   x = random(50, width-50); 
   if (frameCount % 50 == 0) {
     engine.add(new GunShipEnemy(x,y)); 
    }
  }
  
  boolean hasDied() {
    return false;
  }
}
