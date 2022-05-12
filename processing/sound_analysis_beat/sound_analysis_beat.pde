import processing.sound.*;

SoundFile sample;
BeatDetector bt;

int samples = 4096;

public void setup()
{
  size(640, 360);
  sample = new SoundFile(this, "sample.wav");
  sample.loop();
  bt=new BeatDetector(this);
  bt.input(sample);
  fill(255);
  noStroke();
}

public void draw()
{
  background(0);
  if (bt.isBeat())
    ellipse(width/2, height/2, 200, 200);
  else ellipse(width/2, height/2, 10, 10);
}
