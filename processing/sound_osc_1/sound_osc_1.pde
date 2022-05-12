/**
 * Processing Sound Library, Example 1
 *
 * Five sine waves are layered to construct a cluster of frequencies.
 * This method is called additive synthesis. Use the mouse position
 * inside the display window to detune the cluster.
 */

import processing.sound.*;

SinOsc sineWave;
float sineFreq;

void setup() {
  size(640, 360);
  background(255);
  // Init the sine wave oscillator
  sineWave = new SinOsc(this);
  sineWave.play();
  sineWave.amp(1);
}

void draw() {

  //Map mouseY from 0 to 1
  float yoffset = map(mouseY, 0, height, 0, 1);
  //Map mouseY logarithmically to 150 - 1150 to create a base frequency range
  float frequency = pow(1000, yoffset) + 150;
  //Use mouseX mapped from -0.5 to 0.5 as a detune argument
  float detune = map(mouseX, 0, width, -0.5, 0.5);
  sineFreq = frequency *(2*detune);
  // Set the new frequency
  sineWave.freq(sineFreq);
}
