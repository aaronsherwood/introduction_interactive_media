void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  //draw the rect to make the fade
  fill(255,50);
  noStroke();
  rect(0,0,width,height);
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
      rotate(i*sections);
      pushMatrix();
        //draw rects, and then also make them move based on sin
        //i is used to change each individual rect & ellipse separately
        rotate(frameCount*(sin(frameCount*.0004))*i*.0004);
        rect(0,0,100,100);
      popMatrix();
      //draw ellipses changing their sizes based on sin
      ellipse(0, 0, 170, sin(frameCount*.001*i)*sin(frameCount*.0001+.5)*80);
    popMatrix();
  }
}