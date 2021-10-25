class Enemy extends GameObject {

  Enemy(float incomingX, float incomingY) {
    x = incomingX;
    y = incomingY;
    dx = 0;
    dy = 3;
    hp = 5;
    w = 50;
    h = 50;
  }

  void show() {
    fill(255, 5, 5);
    rect (x, y, w, h);
  }

  void act() {
    x = x + dx;
    y = y + dy;
    
    checkCollisions();
  }
  
  void checkCollisions() {
    int i = 0;
    while ( i < engine.size()) {
      GameObject thing = engine.get(i);
      if ( thing instanceof Bullet) {
        if ( rectRect(x, y, 50, 50, thing.x, thing.y, 5, 5)) {
          hp = hp - 1;
          thing.hp = 0;
          for ( int j =0; j <5; j++) {
            engine.add(new Particle(thing.x, thing.y));
          }
        }
      }


      i++;
    }
  }

  boolean hasDied() {

    return y > height || hp < 0;
  }
}
