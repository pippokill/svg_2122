HashMap<String, Sprite> sprites;

PImage backImg = createImage(800, 600, RGB);

final int starsR=600;

int xde=1;int yde=1;int mse=5;

int ps=2;

void setup() {
  size(800, 600);

  initSky();

  // set sprites
  sprites=new HashMap<String, Sprite>();
  sprites.put("s-001", new Sprite("s-001", "assets/img/sprite-001.png", 368, 520));
  sprites.put("s-002", new Sprite("s-002", "assets/img/sprite-002.png", 368, 80));
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
  for (int y=backImg.height-2; y>=0; y--)
    for (int x=0; x<backImg.width; x++) {
      backImg.pixels[(y+1)*backImg.width+x]=backImg.pixels[y*backImg.width+x];
    }
  // la copia precedente può essere realizzata attraverso la funzione copy di PImage 
  //backImg.copy(0, 0, backImg.width, backImg.height-1, 0, 1, backImg.width, backImg.height-1);
  for (int x=0; x<backImg.width; x++) {
    float r=random(starsR);
    if (r<1)
      backImg.pixels[x]=color(168, 164, 50);
    else
      backImg.pixels[x]=color(0, 0, 0);
  }
  background(backImg);
}

void moveEnemy() {
  Sprite s=sprites.get("s-002");
  if (random(1)>0.995)
    xde=-xde;
  if (random(1)>0.995)
    yde=-yde;
  int se=Math.round(random(1,mse));
  s.incX(xde*se);
  s.incY(yde*se);
  if (s.getX()>(width-64) || s.getX()<=0)
    xde=-xde;
  if (s.getY()>(height-150) || s.getY()<=0)
    yde=-yde;   
}

void keyPressed() {
  Sprite s=sprites.get("s-001");
  if (key=='w' && s.getY()>0)
    s.incY(-ps);
  else if (key=='s' && s.getY()<(height-66))
    s.incY(ps);
  else if (key=='a' && s.getX()>0)
    s.incX(-ps);
  else if (key=='d' && s.getX()<(width-64))
    s.incX(ps);
}

void showSprites() {
  for (String sid : sprites.keySet()) {
    Sprite s=sprites.get(sid);
    image(s.getImg(), s.getX(), s.getY());
  }
}

void draw() {
  skyScrolling();
  showSprites();
  moveEnemy();
}
