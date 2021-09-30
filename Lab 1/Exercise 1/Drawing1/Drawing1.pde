
int y = 180;
void setup() {
size(800,600);
fill(random(245),random(255),random(255));

}

void draw(){
  triangle(mouseX, mouseY, 0, 360, 81, 360);
  ellipse(mouseX, mouseY,30,30);
  //rect(mouseX,mouseY,100,100);
  fill(random(255),random(255),random(255) );
  arc(mouseX,mouseY, 100, 100, PI, TWO_PI);
  
line(0, y, width, y); 
  
  y = y - 1; 
  if (y < 0) { 
    y = height;


}
}
