PVector velocity;
PVector gravity;
PVector position;
PVector acceleration;
PVector wind;
float drag = 0.99;
float mass = 50;
float hDampening;

void setup() {
  size(640,360);
  noFill();
  position = new PVector(width/2, 0);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  gravity = new PVector(0, 0.5*mass);
  wind = new PVector(0,0);
  hDampening=map(mass,15,80,.98,.96);
}

void draw() {
  background(255);
  if (!keyPressed){
    wind.x=0;
    velocity.x*=hDampening;
  }
  applyForce(wind);
  applyForce(gravity);
  velocity.add(acceleration);
  velocity.mult(drag);
  position.add(velocity);
  acceleration.mult(0);
  ellipse(position.x,position.y,mass,mass);
  if (position.y > height-mass/2) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      position.y = height-mass/2;
    }
}
  
void applyForce(PVector force){
  // Newton's 2nd law: F = M * A
  // or A = F / M
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}

void keyPressed(){
  if (keyCode==LEFT){
    wind.x=-1;
  }
  if (keyCode==RIGHT){
    wind.x=1;
  }
  if (key==' '){
    mass=random(15,80);
    position.y=-mass;
    velocity.mult(0);
  }
}