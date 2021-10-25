class Bullet extends GameObject {

  Bullet() {
  x = myShip.x;  
  y = myShip.y;
  dx = 0;
  dy = -10;
  hp = 1;
  w = 5;
  h = 5;
  }
  
  void show() {
   fill ( 8, 192, 255);
   rect ( x, y, 5, 5);
  }
  
  void act() {
   x = x + dx;
   y = y + dy;
  
  }
  boolean hasDied() {
  return y < 0 || hp < 0;  
  }
  
}
