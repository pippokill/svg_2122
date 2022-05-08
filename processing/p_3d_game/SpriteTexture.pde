class SpriteTexture {
  
  private PShape sprite;
  
  private int z=0;
  
  public SpriteTexture(String filename) {
    PImage texture=loadImage(filename);
    sprite=createShape();
    sprite.setStrokeWeight(0);
    sprite.setFill(color(0, 0, 0, 0));
    sprite.setStroke(color(0, 0, 0, 0));
    sprite.beginShape();
    sprite.texture(texture);
    sprite.vertex(0,0,0,0,0);
    sprite.vertex(texture.width,0,0,texture.width,0);
    sprite.vertex(texture.width,texture.height,0,texture.width,texture.height);
    sprite.vertex(0,texture.height,0,0,texture.height);
    sprite.endShape();
  }
  
  public SpriteTexture(String filename, int z) {
    this(filename);
    this.z=z;
  }
  
  public PShape getSprite() {
    return sprite;
  }
  
  public int getZ() {
    return z;
  }

  void setZ(int z) {
    this.z=z;
  }
}
