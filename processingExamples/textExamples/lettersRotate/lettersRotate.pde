PFont f;
color red;
float x, y;

String message= "Alternative FACTS...";
LetterRotater[] rotaters;

void setup() {
  size(640, 360);
  f = createFont("Monaco", 42);
  textFont(f, 42);
  red=color(255, 0, 0);
  x=width/2 - textWidth(message)/2;
  y=height/2;
  rotaters= new LetterRotater[message.length()];
  for (int i=0; i<message.length(); i++) {
    char c = message.charAt(i);
    float w = x+textWidth(c)*i;
    rotaters[i]= new LetterRotater(w, y, i, random(10, 85), c);
  }
}

void draw() {
  background(255);
  fill(red);
  for (LetterRotater l : rotaters) {
    l.drawChar();
    l.rotate();
    stroke(red, 50);
    l.checkMouse();
    l.distance(rotaters);
  }
}

class LetterRotater extends Rotater {
  char c;
  LetterRotater(float _x, float _y, int i, float ld, char _c) {
    super(_x, _y, i, ld);
    c = _c;
    x=_x;
    y=_y;
    radius=50;
  }

  void drawChar() {
    text(c, x, y);
  }
}

class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;
  boolean drawLine;
  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(30, 75);
    speed = 0;
    index = i;
    lineDistance = ld;
    drawLine = false;
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
      acceleration=.005;
    }
  }
}

void mousePressed() {
  for (LetterRotater l : rotaters) {
    l.angle=0;
    l.speed=0;
  }
}