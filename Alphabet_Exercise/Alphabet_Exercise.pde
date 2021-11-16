

LetterGenerator lg;
String input = "aebcd";
PImage shark;
PGraphics pg;

// window sizes are ints
int scaler = 3;
// the scale command needs a float percentage
float scaler_f = 1.0 / scaler;

void setup() {
  size(1300, 1000, P3D);
  
  
  shark = loadImage("shark.jpg");

  lg = new LetterGenerator(input, width/2-600, height/2);

  pg = createGraphics(width/scaler, height/scaler, P3D);
   // this odd-looking method turns off smoothing for a sharper result when scaled
  ((PGraphicsOpenGL)pg).textureSampling(3);
}

void draw() {
  pg.beginDraw();
  
  pg.background(random(0,255));
  pg.scale(scaler_f);
  lg.run(); 
  
  pg.endDraw();
  
  image(pg, 0, 0, width, height);
}
