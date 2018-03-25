void mode1() {
  println("straight rectangles");
  int sections=width/300;
  for (int i=0; i<width; i+=sections) {
    pushMatrix();
    translate(i, height/2);
    rect(0, 0, 2, 100);
    popMatrix();
  }
}