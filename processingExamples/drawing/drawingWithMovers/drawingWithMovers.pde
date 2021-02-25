Mover[] m;

void setup() {
  size(640, 640);
  m = new Mover[15];
  for (int i=0; i<m.length; i++) {
    m[i] = new Mover(random(width), random(height), random(20, 600));
  }
  noFill();
  stroke(0, 3);
  background(255);
}

void draw() {
  //background(255);
  for (int i=0; i<m.length; i++) {
    PVector dir = new PVector(mouseX, mouseY);
    m[i].steer(dir);
    m[i].run();
  }
}

void mouseMoved() {
}

class Mover {
  PVector loc, vel, accel;
  float mass, maxForce;

  Mover(float x, float y, float m) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    mass = m;
    maxForce = random(10, 30);
  }

  void update() {
    vel.add(accel);
    loc.add(vel);
    vel.mult(.98);
    accel.mult(0);
  }

  void display() {
    ellipse(loc.x, loc.y, mass, mass);
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector f) {
    f.div(mass);
    accel.add(f);
  }

  void steer(PVector dir) {
    dir.sub(loc);
    float mag = dir.mag();
    dir.normalize();
    if (mag < 100) {
      float m = map(mag, 0, 100, 0, maxForce);
      dir.mult(m);
    } else {
      dir.mult(maxForce);
    }
    applyForce(dir);
  }
}
