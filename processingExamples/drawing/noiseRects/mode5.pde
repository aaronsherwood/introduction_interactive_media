void mode5() {
  println("rectangles with noise heights and rotated based on the same noise values");
  int sections=width/300;
  for (int i=0; i<width; i+=sections) {
    pushMatrix();
    float noiseValue=noise(i*.01);
    translate(i, height/2 + noiseValue*100-50);
    rotate(noiseValue);
    rect(0, 0, 2, 100);
    popMatrix();
  }
}