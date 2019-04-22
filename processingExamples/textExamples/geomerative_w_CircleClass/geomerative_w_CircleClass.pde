import geomerative.*;
RFont font;
RPoint[] pnts;
Circle[] circs;

void setup() {
  size(640, 360);

  RG.init(this);
  font = new RFont("Franklin Goth Ext Condensed.ttf", 200, RFont.CENTER);
  pnts = getPoints("IDEA");
  int amountPerPoint = 2;
  circs = new Circle[pnts.length*amountPerPoint];
  println(pnts.length+" "+circs.length+" "+ pnts.length*amountPerPoint);
  int index = 0;
  for (int i=0; i<pnts.length*amountPerPoint; i+=amountPerPoint) {
    for (int j=0; j<amountPerPoint; j++) {
      int k = i+j;
      circs[i+j] = new Circle(width/2+pnts[index].x+random(-3, 3), height/1.5+pnts[index].y+random(-3, 3), random(4, 15));
    }
    index++;
  }

  noFill();
  stroke(0, 100);
}

void draw() {
  background(255);
  for (int i=0; i<circs.length; i++) {
    circs[i].seekHome();
    circs[i].update();
    circs[i].display();
    //circs[i].checkEdges();
  }
}

void mousePressed(){
  for (int i =0; i<circs.length;i++){
     circs[i].xSpeed = random(-5,5);
     circs[i].ySpeed = random(-5,5);
     circs[i].seek=false;
  }
}

void mouseReleased(){
  for (int i =0; i<circs.length;i++){
     circs[i].seek=true;
  }
}


RPoint[] getPoints(String str) {
  RCommand.setSegmentLength (10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup grp;
  grp = font.toGroup(str);
  grp = grp.toPolygonGroup();
  return grp.getPoints();
}