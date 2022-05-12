import processing.sound.*;

AudioIn in;
Amplitude amp;

public void setup()
{
  size(640, 360);
  in=new AudioIn(this, 0);
  amp=new Amplitude(this);
  amp.input(in);
}

public void draw()
{
  background(0);
  noStroke();
  fill(255, 0, 150);
  float r=map(amp.analyze(),0,1,height/8,height);
  ellipse(width/2,height/2,r,r);
}
