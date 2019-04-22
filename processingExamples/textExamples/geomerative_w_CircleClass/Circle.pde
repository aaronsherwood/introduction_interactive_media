class Circle {
  float x, y, homeX, homeY;
  float xSpeed, ySpeed;
  float diam;
  boolean seek;
  char letter;

  Circle(float _x, float _y, float _diam ) {
    homeX = x = _x;
    homeY = y = _y;
    xSpeed = ySpeed = 0;
    diam = _diam;
    seek = true;
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
    xSpeed *= .95;
    ySpeed *= .95;
  }

  void display() {
    ellipse(x, y, diam, diam);
  }

  void seekHome() {
    if (seek) {
      float dirX = homeX-x;
      float dirY = homeY-y;
      dirX*=.005;
      dirY*=.005;
      xSpeed+=dirX;
      ySpeed+=dirY;
    }
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