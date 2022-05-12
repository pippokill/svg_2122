ArrayList<BoxL> bl=new ArrayList();
int dz=5;
SpriteTexture monster;
boolean dispM=false;

void setup() {
  size(800, 600, P3D);
  for (int i=0; i<10; i++) {
    bl.add(new BoxL(-1000+(i*100)));
  }
  monster=new SpriteTexture("demon.png", -300);
}

void draw() {
  background(color(50, 10, 10, 0));
  dispM=false;
  if (monster.getZ()>=250)
    monster.setZ(-300);
  for (BoxL b : bl) {
    if (b.getZ()>monster.getZ()) {
      pushMatrix();
      translate(0, 0, monster.getZ());
      int mx=mouseX;
      if (mx<200)
        mx=200;
      if (mx>500)
        mx=500;
      shape(monster.getSprite(), mx, height/2);
      popMatrix();
      dispM=true;
    }
    pushMatrix();
    translate(0, 0, b.getZ());
    shape(b.getShape(), 0, 0);
    b.setZ(b.getZ()+dz);
    popMatrix();
  }
  if (!dispM) {
    pushMatrix();
    translate(0, 0, monster.getZ());
    shape(monster.getSprite(), mouseX, height/2);
    popMatrix();
  }

  monster.setZ(monster.getZ()+1);

  if (bl.get(bl.size()-1).getZ()>0) {
    bl.remove(bl.size()-1);
    bl.add(0, new BoxL(-1000));
  }
}
