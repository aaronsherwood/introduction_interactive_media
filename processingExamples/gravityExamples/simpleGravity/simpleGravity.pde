PVector pos;
PVector velocity;
PVector acceleration;
float drag = .99;

void setup(){
  size(640,360);
  pos = new PVector(width/2,0);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,.1);
  
  noFill();
}

void draw(){
  background(255);
  
  velocity.add(acceleration);
  velocity.mult(drag);
  pos.add(velocity);
  ellipse(pos.x,pos.y,50,50);
  if (pos.y>height){
     velocity.y*=-.9;
     pos.y=height;
  }
}