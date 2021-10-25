class Particle extends GameObject {

  Particle(float incomingX, float incomingY) {
    x = incomingX;
    y = incomingY;
    dx = random(-5, 5);
    dy = random(-5, 5);
    hp = random(100, 255);
    w = 5;
    h = 5;
  }

  void show() {
    fill( 201,2,2, hp);
    rect( x, y, w, h);
  }
  void act() {
    x = x + dx;
    y = y + dy;

    hp = hp -2;
  }

  boolean hasDied() {
    return hp <= 0;
  }
}
