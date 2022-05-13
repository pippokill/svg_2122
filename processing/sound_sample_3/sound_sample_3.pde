import processing.sound.*;
AudioSample sample;

void setup() {
  size(640, 360);
  // Create an array and manually write a pulse wave into it
  int resolution = 44100;
  float[] wave = new float[resolution];
  boolean h=false;
  for (int i = 0; i < resolution; i++) {
    if (i%250==0)
      h=!h;
    wave[i] = h?1:0;
  }
  // Create the audiosample based on the data, set framerate to play
  sample = new AudioSample(this, wave, resolution);
  // Play the sample in a loop
  sample.amp(0.5);
  sample.loop();
}

void draw() {
  background(255);
}
