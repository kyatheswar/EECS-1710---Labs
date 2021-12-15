import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
FFT fft;
float[] angle1;
float[] angle2;
float[] y, x, x2, y2;

PShader shader_ripple;
PGraphics pg;
ArrayList<Stroke> strokes;
int marktime = 0;
int timeout = 1000;


void setup() {
  
  //size(screen.width, screen.height, P3D);
  size(1920, 1080, P3D);
  pg = createGraphics(1920, 1080, P3D);
  setupXYscope();
  strokes = new ArrayList<Stroke>();
  
    shader_ripple = loadShader("example3.glsl");
  shader_ripple.set("resolution", float(width), float(height));
  shader_ripple.set("rate", 0.1);
  
  pg.beginDraw();
  pg.background(0);
  pg.endDraw();
  
  minim = new Minim(this);
  player = minim.loadFile("sound.mp3");
  player.play();
  //player = minim.getLineIn)minim.STEREO, 2048, 192000.0);
  fft = new FFT(player.bufferSize(), player.sampleRate());
  y = new float[fft.specSize()];
  x = new float[fft.specSize()];
  x2 = new float[fft.specSize()];
  y2 = new float[fft.specSize()];
  angle1 = new float[fft.specSize()];
  angle2 = new float[fft.specSize()];
  frameRate(120);
}

void draw()
{
 background(0);
  updateXYscope();
 fft.forward(player.mix);
 visualization();
 pg.beginDraw();
 
   if (random(0, 1) < 0.5) pg.blendMode(ADD);
  for (int i=strokes.size()-1; i >= 0; i--) {
    Stroke stroke = strokes.get(i);
    stroke.run();
    if (!stroke.alive && stroke.points.size() == 0) {
      strokes.remove(i);
    }
  }
  
  if (millis() > marktime + timeout) {
    xy.clearWaves();
  }

  shader_ripple.set("time", float(millis())/1000.0);
  shader_ripple.set("tex0", pg);
  pg.filter(shader_ripple);
  
  pg.blendMode(BLEND);
  pg.noStroke();
  pg.fill(0, 5);
  pg.rect(0, 0, width, height);

  pg.endDraw();
  
  image(pg, 0, 0);

  surface.setTitle("" + frameRate);
}

void visualization() {
  noStroke();
  
  //bigger main
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < fft.specSize(); i++) {
    y[i] = y[i]+fft.getBand(i)/1000;
    x[i] = fft.getFreq(i)/500;
    angle1[i] = angle1[i]+ fft.getFreq(i)/3000;
    //rotateX(-Sin(angle[i]/2));
    //rotateY(-Cos(angle[i]/2));//rotate+translate=tap
    //rotateX(angle(angle[i]);
    rotateY(cos(angle1[i]/2));
    
    //Stroke(fft.getFreq(i)*2,0,fft.getBand(i)*2);
    fill(fft.getFreq(i)*5,55, fft.getBand(i)*5);//WIP
    pushMatrix();
    translate((x[i]+200), (y[i]-175));
    //box(fft.getBand(i)/20+fft.getFreq(i)/15);
    //sphere(fft.getBand(i)/20+fft.getFreq(i)/15);
    rect(-fft.getBand(i)/50, -fft.getBand(i)/10, fft.getBand(i)/15, fft.getBand(i)/15);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //top middle
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i =0; i< fft.specSize(); i++) {
    y[i] = y[i];
    x[i] = x[i];
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    //rotateX(Sin(angle[i]/5));
    rotateY(cos(angle2[i]/2));
    //Stroke((fft.getFreq(i)*2,0,fft.getBand(i)*2);
    fill(70, fft.getFreq(i)*3, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+player.right.get(i)-450), (y[i]+player.right.get(i))+100);
    //box(fft.getBand(i)/10+fft.getFreq(i)/15);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //mid middle
  pushMatrix();
  translate(width/2, height/2, 0);
  for(int i = 0; i < fft.specSize(); i++) {
    y[i] = y[i];
    x[i] = x[i];
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    //rotateX(Sin(angle2[i]/5));
    rotateY(cos(angle2[i]/2));
    //Stroke((fft.getFreq(i)*2,0,fft.getBand(i)*2);
    fill(70,fft.getFreq(i)*3, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+player.right.get(i)-450),(y[i]+player.right.get(i)+100));
    //box(fft.getBand(i)/10+fft.getFreq(i)/15);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //bot middle
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i = 0; i < fft.specSize(); i++) {
    y[i] = y[i];
    x[i] = x[i];
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    //rotateX(Sin(angle2[i]/5));
    rotateY(-cos(angle2[i]/2));
    //Stroke(fft.getFreq(i)*2,0,fft.getBand(i)*2);
    fill(70, fft.getFreq(i)*3, 255-fft.getBand(i)*2);
    
    pushMatrix();
    translate((-x[i]+player.right.get(i)+300), (-y[i]+player.right.get(i))+50);
    //box(-fft.getBand(i)/10-fft.getFreq(i)/15);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //right bot tail
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i = 0; i < fft.specSize(); i++) {
    y2[i] = y2[i]+ fft.getFreq(i)/500;
    x[i] = x[i];
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    //rotateX(Sin(angle2[i]/5));
    //rotateY(Cos(angle2[i]/5));
    //  Stroke(fft.getFreq(i)*2,0,fft,getBand(i)*2);
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+600), (-y2[i]+150));
    rect(fft.getBand(i)/5, fft.getBand(i)/5, fft.getFreq(i)/50, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  //left bot tail
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i = 0; i< fft.specSize(); i++) {
    y2[i] = y2[i]+ fft.getFreq(i)/500;
    x[i] = x[i];
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    //rotateX(Sin(angle2[i]/5));
    //rotateY(Cos(angle2[i]/5));
    //  Stroke9fft.getfreq(i)*2,0,fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+300),(y2[i]-600));
    rect(fft.getBand(i)/2, fft.getBand(i)/2, fft.getFreq(i)/20, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  
  //mid left tail
  pushMatrix();
  translate(width/2, height/2,0);
  for (int i = 0; i< fft.specSize(); i++) {
    y2[i] = y2[i]+ fft.getFreq(i)/500;
     x[i] = x[i];
     angle2[i] = angle2[i]+fft.getFreq(i)/10000;
     //rotateX(Sin(angle2[i]/5));
     //rotateY(Cos(angle2[i]/5));
     //    Stroke(ff.getFreq(i)*2,0,fft.getBand(i)*2);
     fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
     pushMatrix();
     translate((x[i]-300), (y2[i]-600));
     rect(-fft.getBand(i)/2, fft.getBand(i)/2, -fft.getFreq(i)/20, fft.getFreq(i)/5);
     popMatrix();
  }
  popMatrix();
  
   //mid right tail
  pushMatrix();
  translate(width/2, height/2,0);
  for (int i = 0; i< fft.specSize(); i++) {
    y2[i] = y2[i]+ fft.getFreq(i)/500;
     x[i] = x[i];
     angle2[i] = angle2[i]+fft.getFreq(i)/10000;
     //rotateX(Sin(angle2[i]/5));
     //rotateY(Cos(angle2[i]/5));
     //    Stroke(ff.getFreq(i)*2,0,fft.getBand(i)*2);
     fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
     pushMatrix();
     translate((x[i]+90), (-y2[i]+600));
     rect(-fft.getBand(i)/5, fft.getBand(i)/5, fft.getFreq(i)/50, fft.getFreq(i)/5);
     popMatrix();
  }
  popMatrix();
  
  //mid mid right tail
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i = 0; i < fft.specSize(); i++) {
    y2[i] = y2[i]+ fft.getFreq(i)/500;
     x[i] = x[i];
     angle2[i] = angle2[i]+fft.getFreq(i)/10000;
     //rotateX(Sin(angle2[i]/5));
     //rotateY(Cos(angle2[i]/5));
     //    Stroke(ff.getFreq(i)*2,0,fft.getBand(i)*2);
     fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
     pushMatrix();
     translate((x[i]-600), (y2[i]+150));
     rect(-fft.getBand(i)/5, fft.getBand(i)/5, -fft.getFreq(i)/50, fft.getFreq(i)/5);
     popMatrix();
  }
  popMatrix();
    
    
    
     //mid mid left tail
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i = 0; i < fft.specSize(); i++) {
    y2[i] = y2[i]+ fft.getFreq(i)/500;
     x[i] = x[i];
     angle2[i] = angle2[i]+fft.getFreq(i)/10000;
     //rotateX(Sin(angle2[i]/5));
     //rotateY(Cos(angle2[i]/5));
     //    Stroke(fft.getFreq(i)*2,0,fft.getBand(i)*2);
     fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
     pushMatrix();
     translate((x[i]-90), (y2[i]+600));
     rect(-fft.getBand(i)/5, fft.getBand(i)/5, -fft.getFreq(i)/50, fft.getFreq(i)/5);
     popMatrix();
  }
  popMatrix();
  
    //big core
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i = 0; i < fft.specSize(); i++) {
    y[i] = y[i];
    x[i] = x[i];
     angle2[i] = angle2[i]+fft.getFreq(i)/20000;
     rotateX(sin(angle2[i]/5)/50);
     rotateY(cos(angle2[i]/5)/50);
     //Stroke(fft.getFreq(i)*2,0,fft.getBand(i)*2);
     fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
     pushMatrix();
     translate((x[i]+50), (y2[i]));
     box(fft.getFreq(i)/50+fft.getFreq(i)/50);
     popMatrix();
  }
  popMatrix();
  
  
      //increase core
  pushMatrix();
  translate(width/2, height/2, 0);
  for (int i = 0; i < fft.specSize(); i++) {
    y[i] = y[i];
    x2[i] = x2[i]+ fft.getFreq(i)/500;
     angle2[i] = angle2[i]+1.007+fft.getFreq(i)/6000;
     rotateX(sin(angle2[i]/5)/15);
     rotateY(cos(angle2[i]/5)/15);
     //Stroke(fft.getFreq(i)*2,0,fft.getBand(i)*2);
     fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
     pushMatrix();
     translate((x[i]+50), (y2[i]));
     box(fft.getFreq(i)/50+fft.getFreq(i)/50);
     popMatrix();
  }
popMatrix();
    
}   
    
    
    
    
    
    
    
    
