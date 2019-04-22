import geomerative.*;
RFont font;
RPoint[] pnts;

void setup() {
  size(640, 360);

  RG.init(this);
  font = new RFont("Franklin Goth Ext Condensed.ttf", 200, RFont.CENTER);
  pnts = getPoints("ZAP");
  
  noFill();
  noLoop();
  stroke(0,100);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/1.5);
  for (int i=0; i<pnts.length; i++) {
    for (int j=0; j<5; j++){
      ellipse(pnts[i].x+random(-5,5), pnts[i].y+random(-5,5), random(4,15), random(4,15));
    }
  }
  popMatrix();
}


RPoint[] getPoints(String str) {
  RCommand.setSegmentLength (10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup grp;
  grp = font.toGroup(str);
  grp = grp.toPolygonGroup();
  return grp.getPoints();
}