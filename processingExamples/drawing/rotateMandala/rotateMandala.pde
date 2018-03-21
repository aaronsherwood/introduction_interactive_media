void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  fill(255,50);
  noStroke();
  rect(0,0,width,height);
  noFill();
  translate(width/2, height/2);
  noFill();
  int sectionAmount = 30;
  float sections = TWO_PI/sectionAmount;
  stroke(0, 10);
  for (int i=0; i<sectionAmount; i++) {
    pushMatrix();
    rotate(i*sections);
    pushMatrix();
    rotate(frameCount*(sin(frameCount*.0004))*i*.0004);
    rect(0,0,100,100);
    popMatrix();

    ellipse(0, 0, 170, sin(frameCount*.001*i)*sin(frameCount*.0001+.5)*80);
    popMatrix();
  }
}