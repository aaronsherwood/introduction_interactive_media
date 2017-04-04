class Mover{
  PVector velocity;
  PVector gravity;
  PVector position;
  PVector acceleration;
  PVector wind;
  float drag;
  float mass;
  
  Mover(PVector pos, float _mass){
    mass=_mass;
    position = pos;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    gravity = new PVector(0, 0.5*mass);
    drag = map(mass,15, 65, .999, .97);
    wind = new PVector(0,0);
  }
  
  void update(){
    if (mousePressed){
    wind.x = -((float(mouseX)/width - .5)*.07)*mass;
      applyForce(wind);
    } else
      velocity.x*=.98;
  
    applyForce(gravity);
    velocity.add(acceleration);
    velocity.mult(drag);
    position.add(velocity);
    bounce();
    acceleration.mult(0);
  }
  
  void display(){
    ellipse(position.x,position.y,mass,mass);
  }
  
  void bounce(){
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
  
}