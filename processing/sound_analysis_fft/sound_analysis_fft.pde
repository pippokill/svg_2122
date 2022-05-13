import processing.sound.*;

AudioIn audioIn;
FFT fft;

int bands = 32;

float[] s = new float[bands];

float barWidth;

public void setup() {
  size(640, 360);

  // Calculate the width of the rects depending on how many bands we have
  barWidth = width/float(bands);

  audioIn = new AudioIn(this, 0);
  audioIn.start();

  // Create the FFT analyzer and connect the playing soundfile to it.
  fft = new FFT(this, bands);
  fft.input(audioIn);
}

public void draw() {
  background(0);
  fill(255, 0, 50);
  noStroke();
  // Perform the analysis
  fft.analyze();
  for (int i = 0; i < bands; i++) {
    s[i] = map(fft.spectrum[i]*5, 0, 1, 0, height);
    rect(i*barWidth, height, barWidth, -s[i]);
  }
}
