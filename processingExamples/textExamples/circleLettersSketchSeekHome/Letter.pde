class Letter {
  float x, y, homeX, homeY;
  float xSpeed, ySpeed;
  char letter;
  boolean seekHome;

  Letter(float _x, float _y, char _c) {
    // we need to save the home location too
    homeX = x = _x;
    homeY = y = _y;
    xSpeed = ySpeed = 0;
    letter = _c;
    // boolean to know when we should be trying to find out way home
    seekHome = false;
  }

  void update() {
    // to find our way home we find the direction from 
    // our current location (x, for example) to our home location (homeX)
    // this is done simply with subtraction
    // then we scale that down a certain degree, 
    // and add that fraction of a direction to our current location
    if (seekHome) {
      x += (homeX - x)*.2;
      y += (homeY - y)*.2;
    } else {
      x += xSpeed;
      y += ySpeed;
      xSpeed *= .98;
      ySpeed *= .98;
    }
  }

  void display() {
    fill(0);
    text(letter, x, y);
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
