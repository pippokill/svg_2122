void setup() {
  size(500,300);
  background(180);
  stroke(0);
  strokeWeight(3);
}

void draw() {
  fill(random(0,255));
  ellipse(random(width),random(height),random(50),random(50));
}
