class BoxL {
  private PShape shape;

  private int z;

  public BoxL(int z) {
    shape = createShape();
    shape.setFill(color(0, 0, 0, 0));
    shape.setStrokeWeight(2);
    shape.setStroke(color(255, 0, 0));
    shape.beginShape();
    shape.vertex(0, 0);
    shape.vertex(width, 0);
    shape.vertex(width, height);
    shape.vertex(0, height);
    shape.vertex(0, 0);
    shape.endShape();
    this.z=z;
  }

  public PShape getShape() {
    return shape;
  }

  public int getZ() {
    return z;
  }

  void setZ(int z) {
    this.z=z;
  }
}
