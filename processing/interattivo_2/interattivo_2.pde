int diam=20;

void setup() {
  size(500,300);
  background(180);
  stroke(0);
  strokeWeight(3);
  fill(255,50);
}

void draw() {
  ellipse(width/2,height/2,diam,diam);
}

/*
void draw() {
  if (diam<500) diam++; else diam=20;
  ellipse(width/2,height/2,diam,diam);
}
*/

/*
void draw() {
  background(180);
  if (diam<500) diam++; else diam=20;
  ellipse(width/2,height/2,diam,diam);
}
*/

/*
void draw() {
  ellipse(mouseX,mouseY,diam,diam);
}
*/
