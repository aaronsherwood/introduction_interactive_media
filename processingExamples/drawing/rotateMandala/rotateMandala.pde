void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  //draw the rect to make the fade
  fill(255, 50);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  //now draw everything else around the center
  translate(width/2, height/2);
  noFill();
  int sectionAmount = 30;
  //divide TWO_PI by the amount of sections 
  //to get number of equal divisions around a circle
  float sections = TWO_PI/sectionAmount;
  stroke(0, 10);
  for (int i=0; i<sectionAmount; i++) {
    pushMatrix();
      //rotate everything
      //i is used to change each individual rect & ellipse separately
      rotate(i*sections);
      drawRect(i);
      drawEllipse(i);
    popMatrix();
  }
}

void drawRect(int i) {
  //draw rects, and then also make them move based on sin
  pushMatrix();
  float amplitude = frameCount*i*.0004;
  float frequency = frameCount*.0004;
  rotate( amplitude * sin(frequency) );
  rect(0, 0, 100, 100);
  popMatrix();
}

void drawEllipse(int i) {
  //draw ellipses changing their sizes based on sin
  float amplitude = 80*sin(frameCount*.001*i);
  float frequency = frameCount*.0001+.5;
  ellipse(0, 0, 170, amplitude*sin(frequency));
}