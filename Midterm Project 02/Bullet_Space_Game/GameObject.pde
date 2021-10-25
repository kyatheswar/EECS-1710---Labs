abstract class GameObject {

  float x, y, dx, w , h , dy, hp;
PImage image;
  GameObject() {
  }

  void show() {
    
    image (image,200,200);
  }

  void act() {
  }

  boolean hasDied() {
    return false;
  }
}
