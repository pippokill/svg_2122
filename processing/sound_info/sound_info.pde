import processing.sound.*;

void setup() {
  String[] ad=Sound.list();
  for (String d : ad)
    System.out.println(d);
}

void draw() {
  background(255);
}
