import processing.javafx.*;
PImage background, clouds;
float x1, x2;
float y1, y2;
float speedX = 10;
float speedX1, speedX2;
int numdevil =10;
int numFoods = 200;


int num = 100;
float[] y = new float[num];
float sW;


Devil[] devil = new Devil[numdevil];
Food[] foods = new Food[numFoods];

void setup() {
  size(1400, 600, FX2D);
  surface.setLocation(987, 200);

  background = loadImage("background.png");
  clouds = loadImage("clouds.png");
  x1 = width/2;
  y1 = height/2;
  x2 = x1 +50;
  y2 = y1 + 50;
  speedX1 = 20;
  speedX2 = speedX1 *0.5;

  imageMode(CENTER);
  //tint(255, 200) ;


  for (int i=0; i<devil.length; i++) {
    devil[i] = new Devil(random(width), random(height));
  }

  for (int i=0; i<foods.length; i++) {
    foods[i] = new Food(random(width), random(height));
  }
  for ( int n=0; n<num; n++) {
    y[n] = height/num*n;
  }
  sW = height/num/2;
}



void draw() {

  background (#ffeb00);


  for ( int n = 0; n<num; n++) {
    float alpha = map(y[n], 0, height, 0, 255);
    stroke(#F10000, alpha);
    strokeWeight(sW);
    line(0, y[n], width, y[n]);

    y[n] += 0.5;
    if (y[n]>height) y[n]=0;
  }
  noTint();
  image(clouds, 60, 50, x1, y2);
  image(clouds, 800, 20, x2, y2);
  image(background, x1, y1);


  for (int i=0; i<devil.length; i++) {
    devil[i].run();
  }
  for (int i=0; i<foods.length; i++) {
    foods[i].run();
  }


  stroke(#000000);
  strokeWeight(height/3);
  noFill();

  ellipse(width/2, height/2, height/10+height+height+height/6, height/10+height+ height+height/6);

  //tint(255, 127);
  //background(random(0));
  //background(127);
  //background(0, 100, 200, 20);

  // image(background, x1, y1, width, height);
  //image(background, x1, y1);
  //noTint();
  //image(clouds, 60, 50, x1, y2);
  //image(clouds, 800, 20, x2, y2);








  x1 += speedX1;
  x2 += speedX2;
  if (x1 > width || x1<0) {
    speedX1 *= -1;
    speedX2 *= -1;
  }
  //for (int i=0; i<foods.length; i++) {
  //foods[i].run();
  //}

  //for (int i=0; i<devil.length; i++) {
  // devil[i].run();
  //}
}
