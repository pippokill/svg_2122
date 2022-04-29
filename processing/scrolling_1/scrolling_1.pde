PImage backImg = createImage(800, 600, RGB);

final int starsR=600;

void setup() {
  size(800, 600);
  initSky();
}

void initSky() {
  for (int y=0; y<backImg.height; y++)
    for (int x=0; x<backImg.width; x++) {
      float r=random(starsR);
      if (r<1)
        backImg.pixels[y*backImg.width+x]=color(168, 164, 50);
      else
        backImg.pixels[y*backImg.width+x]=color(0, 0, 0);
    }
}

void skyScrolling() {
  /*for (int y=backImg.height-2; y>=0; y--)
    for (int x=0; x<backImg.width; x++) {
      backImg.pixels[(y+1)*backImg.width+x]=backImg.pixels[y*backImg.width+x];
    }*/
  // la copia precedente può essere realizzata attraverso la funzione copy di PImage 
  backImg.copy(0, 0, backImg.width, backImg.height-1, 0, 1, backImg.width, backImg.height-1);  
  for (int x=0; x<backImg.width; x++) {
    float r=random(starsR);
    if (r<1)
      backImg.pixels[x]=color(168, 164, 50);
    else
      backImg.pixels[x]=color(0, 0, 0);
  }
  background(backImg);
}

void draw() {
  skyScrolling();
}
