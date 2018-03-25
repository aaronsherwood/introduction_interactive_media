void mode2() {
  println("rectangles with completely random heights");
  int sections=width/300;
  for (int i=0; i<width; i+=sections) {
    pushMatrix();
    translate(i, random(height));
    rect(0, 0, 2, 100);
    popMatrix();
  }
}