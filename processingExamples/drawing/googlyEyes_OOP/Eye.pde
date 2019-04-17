class Eye {
  float x, y;
  PVector direction;
  int diameter;

  Eye(float _x, float _y, int diam) {
    x = _x;
    y = _y;
    diameter = diam;
    direction = new PVector();
  }

  void run() {
    update();
    display();
  }

  void update() {
    //get the direction of the eye coords towards the X using subtraction
    direction.x = mouseX-x;
    direction.y = mouseY-y;

    // if the length of the vector is longer than 20, clip it to 20
    if (direction.mag()>diameter*.2)
      direction.setMag(diameter*.2);
  }

  void display() {
    //draw the outline of the eye
    pushStyle();
    noFill();
    ellipse(x, y, diameter, diameter);
    popStyle();

    //draw the pupil
    pushMatrix();
    translate(x, y);
    fill(0);
    ellipse(direction.x, direction.y, diameter/2, diameter/2);
    popMatrix();
  }
}