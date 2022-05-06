PImage img;

void setup() {
  size(640, 360, P3D);
  img = loadImage("mappa-italia.jpg");
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  stroke(255);
  fill(127);
  beginShape();
  texture(img);
  vertex(-100, -100, 0, 0, 0);
  vertex( 100, -100, 0, 400, 0);
  vertex( 100, 100, 0, 400, 480);
  vertex(-100, 100, 0, 0, 480);
  endShape();
  
}
