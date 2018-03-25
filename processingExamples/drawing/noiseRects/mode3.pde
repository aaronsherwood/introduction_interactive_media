void mode3() {
  println("rectangles with restrained random heights");
  int sections=width/300;
  for (int i=0; i<width; i+=sections) {
    pushMatrix();
    translate(i, height/2+random(-30,30));
    rect(0, 0, 2, 100);
    popMatrix();
  }
}