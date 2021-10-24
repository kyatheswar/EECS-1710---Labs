int Hour, Second, Minute, myHour;
float sdeg, mdeg, hdeg, sx, sy, mx, my, hx, hy;
long current_time;

void setup() {
  size(800, 800);
  background(140);
  make_face();
  current_time = millis();
  Second = second();
  Minute = minute();
  myHour = hour();

  if (myHour > 12) {
    Hour = myHour - 12;
  } else {
    Hour = myHour;
    if (Hour==0) {
      Hour = 12;
    }
  }
}

void draw() {
  if (current_time+1000 < millis()) {
    current_time = millis();

//refresh
fill(255, 0, 0);
noStroke();
ellipse(width/2, height/2,250,250);
    //update
    Second++;
    if (Second >59) {
      Second = 0;
      Minute++;
      if (Minute>59) {
        Minute = 0;
        Hour++;
        if (Hour>12) {
          Hour = 1;
        }
      }
    }
    
    //calculation
    sdeg = Second * 6;
    mdeg = Minute * 6 + (sdeg * 0.016666667);
    hdeg = Hour * 30 + (mdeg * 0.08333333);

     sx = width/2 +110*cos((sdeg-90)*(PI/180));
    sy = height/2 +110 *sin((sdeg-90)*(PI/180));
    mx = width/2 +90* cos ((mdeg-90)*(PI/180));
    my = height/2 +90* cos ((mdeg-90)*(PI/180));
    hx = width/2 +70*cos ((hdeg-90)*(PI/180));
    hy = height/2 +70*sin ((hdeg-90)*(PI/180));
// Display
    stroke(0);
    line(width/2, height/2, sx, sy);
    line(width/2, height/2, mx, my);
    line(width/2, height/2, hx, hy);
    
    fill(0);
    //Stroke();
    stroke(255);
    ellipse(width/2, height/2, 10,10);
    
    textSize(20);
    text("EXERCISE ClOCK", (width/2)-70, (height/2)-60);
  }
}

void make_face() {
  
  for(int i=0; i<360; i+=10) {
    fill(255,0,0);
      noStroke();
      ellipse(width/2 + 170*cos(i*(PI/180)), height/2 + 170*sin(i*(PI/180)), 10, 10);
  
  }
  fill(255, 0, 0);
  noStroke();
  ellipse (width/2, height/2, 320, 320);


  fill(255);
  noStroke();
  ellipse (width/2, height/2, 320, 320);

  fill(255, 0, 0);
  noStroke();
  ellipse (width/2, height/2, 310, 310);

  for (int i=0; i<360; i+=6) {
    stroke(0);
    line(width/2 + 150*cos(i*(PI/180)), height/2 + 150*sin(i*(PI/180)), width/2 + 145*cos(i*(PI/180)), height/2 + 145*sin(i*(PI/180)));
    if (i%30 ==0) {
      fill(255);
      noStroke();
      ellipse(width/2 + 135*cos(i*(PI/180)), height/2 + 135*sin(i*(PI/180)), 10, 10);
    }
  }
}
