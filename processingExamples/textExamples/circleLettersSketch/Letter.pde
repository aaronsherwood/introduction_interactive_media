class Letter {
  float x, y;
  float xSpeed, ySpeed;
  char letter;

  Letter(float _x, float _y, char _c) {
    x = _x;
    y = _y;
    xSpeed = ySpeed = 0;
    letter = _c;
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
    xSpeed *= .98;
    ySpeed *= .98;
  }

  void display() {
    fill(0);
    text(letter,x,y);
  }

  void checkEdges() {
    if (y>height) {
      y=0;
    }
    if (y<0) {
      y=height;
    }
    if (x>width) {
      x=0;
    }
    if (x<0) {
      x=width;
    }
  }
}
