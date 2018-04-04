import geomerative.*;
RFont font;
String textTyped = "Aaron";

Rotater[] rotaters;
RPoint[] pnts;

void setup() {
  size(640, 360);
  rotaters = new Rotater[200];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = 20;
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
  RG.init(this);
  font = new RFont("Franklin Goth Ext Condensed.ttf", 200, RFont.LEFT);
  RCommand.setSegmentLength (10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup grp;
  grp = font.toGroup(textTyped);
  grp = grp.toPolygonGroup();
  pnts = grp.getPoints();
}

void draw() {
  background(255);
  stroke(255, 0, 0, 75);
  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(pnts);
  }
}

class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;
  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(30, 75);
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    direction=-1;
    float coinflip = random(1);
    if (coinflip>.5)
      direction=1;
  }

  void rotate() {
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    speed+=acceleration;
    angle+=speed*direction;
    speed*=.98;
    acceleration=0;
  }

  void distance(RPoint[] pnts) {
    checkMouse();
    int index=0;
    for (RPoint r : pnts) {
      if (dist(x, y, r.x+100, r.y+230)<lineDistance) {
        line(x, y, r.x+100, r.y+230);
        if (mousePressed)
          rect(x, y, 2, 2);
        if (index>0 && index< pnts.length-1) {
          line(r.x+100, r.y+230, pnts[index-1].x+100, pnts[index-1].y+230);
          line(r.x+100, r.y+230, pnts[index+1].x+100, pnts[index+1].y+230);
        }
      }
      index++;
    }
  }


  void checkMouse() {
    if (dist(mouseX, mouseY, x, y)<75 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
    }
  }
}