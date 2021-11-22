import peasy.*;
import processing.video.*;

Capture video;
PeasyCam cam;

void setup() {
  size(640, 480, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(1000);
  frameRate(30);
  video = new Capture(this, width, height, 50);
  String[] devices = Capture.list();
  println(devices);
  video.start();
}
 
 void draw() {
  noFill();
  lights();
  strokeWeight(2);
  
  background(100,5,45);
  pushMatrix();
  
  if (video.available()) {
   video.read();
   video.loadPixels();
  }
  translate(-width/2, -height/2, 0);
  
  for (int y = 0; y < video.height; y+=4) {
   beginShape();
   for (int x = 0; x < video.width; x++) {
    int pixelValue = video.pixels[x+(y*video.width)];
    
    stroke(0,brightness(pixelValue),924,390);
    vertex (x, y, (brightness(pixelValue)/1.2)-100);
   }
   endShape();
  }
  popMatrix();
 }
