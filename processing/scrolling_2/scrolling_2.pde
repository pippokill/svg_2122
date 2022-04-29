PImage homeImg;

PImage backImg = createImage(640, 480, RGB);

boolean ins=true;
int xs=0;

void setup() {
  size(640, 480);
  homeImg=loadImage("cactus.png");
  initBackground();
}

void initBackground() {
  for (int y=0; y<backImg.height; y++) {
    for (int x=0; x<backImg.width; x++) {
      if (y<backImg.height-90)
        backImg.pixels[y*backImg.width+x]=color(235, 113, 52);
      else
        backImg.pixels[y*backImg.width+x]=color(235, 183, 52);
    }
  }
  background(backImg);
}

void scroll() {
  backImg.copy(1, 0, backImg.width-1, backImg.height, 0, 0, backImg.width-1, backImg.height);
  for (int y=0; y<backImg.height; y++) {
    if (y<backImg.height-90)
      backImg.pixels[y*backImg.width+backImg.width-1]=color(235, 113, 52);
    else
      backImg.pixels[y*backImg.width+backImg.width-1]=color(235, 183, 52);
  }
  if (ins) {
    if (xs<homeImg.width) {
      backImg.copy(homeImg, xs, 0, 1, homeImg.height, backImg.width-1, backImg.height-homeImg.height-32, 1, homeImg.height);
      xs++;
    } else {
      xs=0;
      ins=false;
    }
  } else {
    /*for (int y=0; y<backImg.height; y++) {
     if (y<backImg.height-90)
     backImg.pixels[y*backImg.width+backImg.width-1]=color(235, 113, 52);
     else
     backImg.pixels[y*backImg.width+backImg.width-1]=color(235, 183, 52);
     }*/
    float r=int(random(100));
    ins=(r==1);
  }
  background(backImg);
}

void draw() {
  scroll();
}
