 import processing.javafx.*;
PImage image;
ArrayList<GameObject> engine;
boolean wkey, akey, skey, dkey, spacekey;
Space_Ship myShip;
void setup() {
  size(800, 600, FX2D);
  engine = new ArrayList<GameObject>(1000);
  myShip = new Space_Ship();
  engine.add(myShip);
  engine.add(new Enemy_Launcher());
rectMode(CENTER);
noStroke();
}

void draw() {

  background(0);
  
  int i = engine.size()-1;
  while (i >= 0) {
    GameObject obj = engine.get(i);
    obj.show();
    obj.act();
    if (obj.hasDied()) {
      engine.remove(i);
    }
    i--;
  }
  engine.add(new Stars());
}


void keyPressed() {
  if (key =='w' || key == 'W') wkey = true;
  if (key =='s' || key == 'S')skey = true;
   if (key =='a' || key == 'A') akey = true;
   if (key =='d' || key == 'D') dkey = true;
     if (key ==' ')         spacekey = true;
}



void keyReleased() {
  if (key =='w' || key == 'W') wkey = false ;
  if (key =='s' || key == 'S')skey = false;
   if (key =='a' || key == 'A') akey = false;
   if (key =='d' || key == 'D') dkey = false;
     if (key ==' ')         spacekey = false;
}
