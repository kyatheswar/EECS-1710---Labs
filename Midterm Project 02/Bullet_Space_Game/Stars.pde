class Stars extends GameObject{
 
  Stars() {
  x = random(0, width);
  y = 0;
  dx = 0;
  dy = random(3,5);
  }
  
  void show() {
  fill(#DBDBDB);
  rect(x,y,dy,dy);
  
  }
void act() {
  x = x+dx;
  y = y + dy;
}

boolean hasDied(){
  return y > height;

}
}
