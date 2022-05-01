// drag up and down the left edge to zoom
// drag across the bottom edge to rotate
// drag in the middle to pan

enum UIState {
  NEUTRAL, PANNING, SCALING, ROTATING;
}
UIState UIstate;

float viewScale;
float viewX, viewY;
float viewAng, viewCosAng, viewSinAng;

PImage[] tiles=new PImage[4];
int k=0;

void setup() {
  size( 640, 480 );

  colorMode( RGB );
  noStroke();

  viewScale = 4 ;
  viewX = 0.0;
  viewY = 0.0;
  viewAng = 0.0;
  viewCosAng = 1.0;
  viewSinAng = 0.0;

  UIstate = UIState.NEUTRAL;

  tiles[0]=loadImage("tree_A.png");
  tiles[1]=loadImage("tree_B.png");
  tiles[2]=loadImage("tree_C.png");
  tiles[3]=loadImage("tree_D.png");
}

void drawCell(int i, int j) {
  image(tiles[k], i*16, j*16);
  k++;
  if (k>3)
    k=0;
}

void draw() {
  background(50, 116, 58);
  scale( viewScale );
  rotate( viewAng );
  translate( -viewX, -viewY );
  for ( int i=0; i<=100; i++ ) {
    for ( int j=0; j<=100; j++ ) {
      drawCell( i, j );
    }
  }
  k=0;
  System.out.println("Scale: "+viewScale);
  System.out.println("View-ang: "+viewAng);
  System.out.println("View-x: "+viewX+", View-y: "+viewY);
}



void mousePressed() {
  if ( mouseX < width*0.10 )
    UIstate = UIState.SCALING;
  else if ( mouseY > height*0.90 )
    UIstate = UIState.ROTATING;
  else
    UIstate = UIState.PANNING;
}

void mouseDragged() {
  if ( UIstate == UIState.SCALING ) {
    float dy = 1.0 + (float)(pmouseY - mouseY) / height * 2.0;
    viewScale *= dy;
  } else if ( UIstate == UIState.ROTATING ) {
    float da = (float)(pmouseX - mouseX) / height * 2.0;
    viewAng += da;
    viewCosAng = cos( viewAng );
    viewSinAng = sin( viewAng );
  } else if ( UIstate == UIState.PANNING ) {
    float tx = (pmouseX - mouseX) / viewScale;
    float ty = (pmouseY - mouseY) / viewScale;
    float dx = viewCosAng * tx + viewSinAng * ty;
    float dy = -viewSinAng * tx + viewCosAng * ty;
    viewX += dx;
    viewY += dy;
  }
}

void mouseReleased() {
  UIstate = UIState.NEUTRAL;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  viewScale /= pow( 1.10, e );
}
