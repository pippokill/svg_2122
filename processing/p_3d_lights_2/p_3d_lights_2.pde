void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(0);
  translate(200, 200, 0);
  ambientLight(128, 0, 0);
  directionalLight(0, 0, 200, 200, 350, -100);
  noStroke();
  fill(255);
  sphere(150);
}
