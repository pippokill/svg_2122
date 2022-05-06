void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(0);
  translate(200, 200, 0);
  spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  noStroke();
  fill(255);
  sphere(150);
}
