class GunShipEnemy extends Enemy {

  GunShipEnemy(float incomingX, float incomingY) {
    super(incomingX, incomingY);
    w = 75;
    h = 75;
    hp = 100;
    
}

void show() {
 fill( #CE0000);
 rect(x, y, w, h);
 
}

void act() {
  if (y < height/2) {
  x = x + dx;
  y = y + dy;
  
  }
  checkCollisions();
} 
}
