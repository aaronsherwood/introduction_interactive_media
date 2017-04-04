Mover [] circles = new Mover[12];


void setup() {
  size(640,360);
  noFill();
  for (int i=0; i<circles.length; i++){
    circles[i]=createMover();
  }
  
}

void draw() {
  background(255);
  for (int i=0; i<circles.length; i++){
    circles[i].update();
    circles[i].display();
  }
  
}

Mover createMover(){
  PVector start= new PVector(random(100,width-100),0);
  Mover circle = new Mover(start, random(15,65));
  return circle;
}