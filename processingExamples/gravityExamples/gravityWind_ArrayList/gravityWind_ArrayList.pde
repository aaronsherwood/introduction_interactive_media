ArrayList<Mover> circles = new ArrayList<Mover>();
float globalWind=0;

void setup() {
  size(640,360);
  noFill();
  for (int i=0; i<12; i++){
    circles.add(createMover());
  }
  
}

void draw() {
  background(255);
  for (int i=0; i<circles.size(); i++){
    circles.get(i).update();
    circles.get(i).display();
  }
  if (!keyPressed)
    globalWind=0;
  
}

Mover createMover(){
  PVector start= new PVector(random(100,width-100),0);
  Mover circle = new Mover(start, random(15,65));
  return circle;
}

void keyPressed(){
  if (keyCode==LEFT){
    globalWind=-1;
  }
  if (keyCode==RIGHT){
    globalWind=1;
  }
  if (key==' '){
    circles.clear();
    for (int i=0; i<12; i++){
      circles.add(createMover());
    }
  }
  if (key=='r'){
    if (circles.size()>0)
      circles.remove(0);
  }
}

void mousePressed(){
  circles.add(createMover());
}