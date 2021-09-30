import processing.javafx.*;


PImage[] gif;
int numberOfFrames;
PImage background, clouds ;
float x1, x2;
float y1, y2;
float speedX = 10;
float speedX1, speedX2;
int f;




void setup() {
  size(1000, 600, FX2D);
  background = loadImage("background.jpg");
  clouds = loadImage("clouds.png");
  x1 = width/2;
  y1 = height/2;
  x2 = x1 +50;
  y2 = y1 - 50;
  speedX1 = 5;
  speedX2 = speedX1 *0.5;

  imageMode(CENTER);
  tint(255, 200) ;
  
  
numberOfFrames =7 ;
gif = new PImage[numberOfFrames];

   int i = 0;
   while (i < numberOfFrames) {
     gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");  
     i = i + 1;
     
   }
   
  
}

void draw() {
    tint(255, 127);

  background(0);
   image(background, x1, y1, background.width *(height /background. height), height);
   image(clouds,100,100 ,x2, y2);
   image(clouds,800,100 ,x2, y2); 
   noTint();
    
  
 


  x1 += speedX1;
  x2 += speedX2;
  if (x1 > width || x1<0 ) {
    speedX1 *= -1;
    speedX2 *= -1;
  }
  
  image(gif[f],mouseX,height/1.2,200,200);
  f= f+1;
  if ( f == numberOfFrames) f=0;
  
}
