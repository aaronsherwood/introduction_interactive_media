import geomerative.*;
RFont font;
RPoint[] pnts;

void setup() {
  size(640, 360);

  RG.init(this);
  // set the font, the size, and left, center, or right adjusted
  font = new RFont("Franklin Goth Ext Condensed.ttf", 200, RFont.CENTER);
  
  // get the points along a String
  pnts = getPoints("Bubbles");
  
  noFill();
  noLoop();
  stroke(0,100);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/1.5);
  for (int i=0; i<pnts.length; i++) {
    //make 2 circles for every point
    for (int j=0; j<2; j++){
      float diam = random(5,15);
      ellipse(pnts[i].x+random(-3,3), pnts[i].y+random(-3,3), diam, diam);
    }
  }
  popMatrix();
}

// function that returns an array of RPoints based on a string
RPoint[] getPoints(String str) {
  // change this number to change the resolution of points outlining the circle
  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup grp;
  grp = font.toGroup(str);
  grp = grp.toPolygonGroup();
  return grp.getPoints();
}