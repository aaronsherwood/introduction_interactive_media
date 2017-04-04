class Mover{
  PVector velocity;
  PVector gravity;
  PVector position;
  PVector acceleration;
  PVector wind;
  float drag;
  float mass;
  float hDampening;
  
  Mover(PVector pos, float _mass){
    mass=_mass;
    position = pos;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    gravity = new PVector(0, 0.5*mass);
    drag = map(mass,15, 80, .999, .96);
    wind = new PVector(0,0);
    set_hDampening();
  }
  
  void update(){
    wind.x=globalWind;
    if (globalWind==0)
      velocity.x*=hDampening;
    applyForce(wind);
    applyForce(gravity);
    velocity.add(acceleration);
    velocity.mult(drag);
    position.add(velocity);
    bounce();
    bounds();
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
  
  void bounds(){
    if (position.x>width)
      position.x=0;
    if (position.x<0)
     position.x=width;
  }
  
  void set_hDampening(){
    hDampening=map(mass,15,80,.98,.96);
  }
  
  void applyForce(PVector force){
    // Newton's 2nd law: F = M * A
    // or A = F / M
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
}