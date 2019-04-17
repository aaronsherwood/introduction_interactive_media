class Ball {
  float xSpeed, ySpeed;
  PVector loc;

  Ball(float x, float y) {
    loc = new PVector(x, y);
    xSpeed = random(-5, 5);
    ySpeed = random(-5, 5);
  }

  void update() {
    loc.x+=xSpeed;
    loc.y+=ySpeed;
  }

  void display() {
    ellipse(loc.x, loc.y, 30, 30);
  }

  void checkEdges() {
    if (loc.x>width || loc.x<0)
      xSpeed*=-1;
    if (loc.y>height || loc.y<0)
      ySpeed*=-1;
  }
  
  void run(){
    update();
    display();
    checkEdges();
  }
}