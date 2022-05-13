import processing.sound.*;

SoundFile sample;
Waveform waveform;

int samples = 4096;

AudioIn in;

public void setup()
{
  size(640, 360);
  background(255);
  //sample = new SoundFile(this, "sample.wav");
  //sample.loop();
  in=new AudioIn(this, 0);
  waveform = new Waveform(this, samples);
  //waveform.input(sample);
  waveform.input(in);
}

public void draw()
{
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();

  waveform.analyze();

  beginShape();
  for(int i = 0; i < samples; i++)
  {
    vertex(
      map(i, 0, samples, 0, width),
      map(waveform.data[i], -1, 1, 0, height)
    );
  }
  endShape();
}
