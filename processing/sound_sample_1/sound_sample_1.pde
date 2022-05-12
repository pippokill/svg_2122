import processing.sound.*;
SoundFile sf;

void setup() {
  size(320, 240);
  sf=new SoundFile(this, "sample.wav");
  sf.loop();
}

void draw() {
  float amp=map(mouseX, 0, width, 0.1, 1);
  sf.amp(amp);
  float r=map(mouseY, 0, height, 1, 3);
  sf.rate(r);
}
