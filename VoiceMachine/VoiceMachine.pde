float scaleAmp = 1000;
float scaleFreq = 1000;

void setup() {
  size(800, 600, FX2D);  
  setupMinim();
}

void draw() {
   background(125, 255, 125);
   noStroke();
   fill(255, 0, 150);
   rect(width/2, height,(amp*100 * scaleAmp), 100  * scaleAmp);
   ellipse(width, height,(amp*500 * scaleAmp), 100  * scaleAmp);
   fill(0,56,0);
  
  updateMinim();
  
  println("amp: " + amp + " freq: " + freq);

  rectMode(CENTER);
  float fillValR = constrain(map(freq, 0, scaleFreq, 0, 255), 0, scaleFreq);
  float fillValG = constrain(map(freq, 0, scaleFreq, 0, 127), 0, scaleFreq);
  float fillValB = constrain(map(freq, 0, scaleFreq, 0, 70), 0, scaleFreq);
  fill(fillValR, fillValG, fillValB);
  ellipse(width/2, height/2 - (amp * scaleAmp), 500, amp * scaleAmp);
  
}

void exit() {
  stopMinim();
}
