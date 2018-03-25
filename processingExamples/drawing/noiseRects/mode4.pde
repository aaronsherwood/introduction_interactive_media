void mode4() {
  println("rectangles with noise heights");
  int sections=width/300;
  for (int i=0; i<width; i+=sections) {
    println(i);
    pushMatrix();
    float noiseValue=noise(i*.01);
    translate(i, height/2 + noiseValue*100-50);
    rect(0, 0, 2, 100);
    popMatrix();
  }
}