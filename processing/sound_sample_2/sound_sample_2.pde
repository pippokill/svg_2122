import processing.sound.*;
SoundFile sf;
enum PlayState {
  PLAY, STOP, PAUSE
};
PlayState ps=PlayState.PLAY;
void setup() {
  size(320, 240);
  sf=new SoundFile(this, "sample.wav");
  sf.loop();
  ps=PlayState.PLAY;
}
void keyPressed() {
  if (key=='p')
    ps=PlayState.PLAY;
  else if (key=='s')
    ps=PlayState.STOP;
  else if (key=='o')
    ps=PlayState.PAUSE;
}

void draw() {
  if (ps==PlayState.PLAY) {
    background(0, 255, 0);
    if (!sf.isPlaying())
      sf.loop();
  } else if (ps==PlayState.PAUSE) {
    background(255);
    if (sf.isPlaying())
      sf.pause();
  } else if (ps==PlayState.STOP) {
    background(255, 0, 0);
    if (sf.isPlaying())
      sf.stop();
  }
}
