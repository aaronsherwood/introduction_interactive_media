Rotater[] rotaters;

void setup() {
  size(640, 360);
  rotaters = new Rotater[200];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 50);
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
}

void draw() {
  background(255);
  stroke(255, 0, 0, 75);
  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(rotaters);
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
    //rect(x, y, 2, 2);
  }

  void distance(Rotater[] rotaters) {
    checkMouse();
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {
          line(x, y, r.x, r.y);
        }
      }
    }
  }

  void checkMouse() {
    if (dist(mouseX, mouseY, x, y)<100 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
    }
  }
}