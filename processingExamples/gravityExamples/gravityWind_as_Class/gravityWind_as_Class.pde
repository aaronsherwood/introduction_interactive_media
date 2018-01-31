Mover circle;
float globalWind=0;

void setup() {
  size(640,360);
  noFill();
  PVector start= new PVector(random(100,width-100),0);
  circle = new Mover(start, random(15,80));
}

void draw() {
  background(255);
  circle.update();
  circle.display();
  if (!keyPressed)
    globalWind=0;
}

void keyPressed(){
  if (keyCode==LEFT){
    globalWind=-1;
  }
  if (keyCode==RIGHT){
    globalWind=1;
  }
  if (key==' '){
    circle.mass=random(15,80);
    circle.set_hDampening();
    circle.position.y=-circle.mass;
    circle.velocity.mult(0);
  }
}