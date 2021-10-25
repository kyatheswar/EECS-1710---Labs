class Space_Ship extends GameObject {

  Gun myGun;
  
  Space_Ship() {
    
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
    w = 50;
    h = 50;
    myGun =   new MachineGun();
  }
  
  void show() {
   fill (0, 146, 255);
  //image( image,w,h);
   ellipse (x, y, 100, h);
  }
  
  void act() {
    dx = 0;
    dy = 0;
    
    if(wkey){ dy = -5;println("w");}
    if(skey){ dy = 5;println("s");}
    if(akey){ dx = -5;println("a");}
    if(dkey){ dx = 5;println("d");}
    if(spacekey) myGun.shoot();
       
       x = x + dx;
       y = y + dy;
       myGun.recharge();
       
  }
  
boolean hasDied(){
  return false;
  
}

}
  
