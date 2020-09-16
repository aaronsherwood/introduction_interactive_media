void setup() {
  size(640, 640);
}

void draw() {
  background(255);
  for (int y=0; y<height; y+=30) {
    for (int x=0; x<width; x+=30) {
      float xVec= mouseX-x;
      float yVec = mouseY-y;
      PVector pvec = new PVector(xVec, yVec);
      float angle = pvec.heading(); //or atan2(yVec, xVec);
      pushMatrix();
      translate(x, y);
      rotate(angle);
      line(0, 0, 30, 0);
      popMatrix();
    }
  }
}