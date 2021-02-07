import geomerative.*;
RFont font;
String phrase = "Circles";
float xOffset = 0;

RPoint[] pnts;

void setup() {
  size(800, 800);
  RG.init(this);
  font = new RFont("Franklin Goth Ext Condensed.ttf", 175, RFont.LEFT);

  // load the phrase into geomerative
  // the first line sets how much distance should there by between each point 
  RCommand.setSegmentLength(4);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup grp;
  grp = font.toGroup(phrase);
  grp = grp.toPolygonGroup();
  pnts = grp.getPoints();

  // to set the word in the middle of the screen
  // get the size of the phrase usbtracted from the width of the screen
  // this is the amount left over
  xOffset = width - grp.getBottomRight().x - grp.getBottomLeft().x;
  // divide that by two to center it
  xOffset = xOffset/2;

  noFill();
  stroke(255, 0, 0, 75);
}

void draw() {
  background(255);

  for (int i=0; i< pnts.length; i++) {
    // make some noise (wut wut)
    float moveIt = (noise(frameCount*.01+i*.01)-.5)*10;
    float x = pnts[i].x + moveIt + xOffset;
    float y = pnts[i].y + moveIt + height/2;

    // dividing makes it invert it's action, sort of
    float diam = 2500/dist(x, y, mouseX, mouseY);
    diam = constrain(diam, 7, 70);

    ellipse(x, y, diam, diam);
  }
}
