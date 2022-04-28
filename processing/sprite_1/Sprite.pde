class Sprite {
  int x=0;
  int y=0;
  
  final String id;

  final PImage img;

  Sprite(String id, String imagePath) {
    this.id=id;
    img=loadImage(imagePath);
  }
  
  Sprite(String id, String imagePath, int x, int y) {
    this.id=id;
    img=loadImage(imagePath);
    this.x=x;
    this.y=y;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
  
  public void setX(int x) {
    this.x=x;
  }

  public void setY(int y) {
    this.y=y;
  }
  
  public void incX(int x) {
    this.x+=x;
  }

  public void incY(int y) {
    this.y+=y;
  }

  public PImage getImg() {
    return img;
  }
  
  public String getId() {
    return id;
  }

  public void incX() {
    x++;
  }

  public void decX() {
    x--;
  }

  public void incY() {
    y++;
  }

  public void decY() {
    y--;
  }
}
