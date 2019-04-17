class DirectionLine {
  
  //variables
  float angle;
  float len;
  PVector origin;
  
  //constructor
  DirectionLine(float x, float y, float _len) {
    origin = new PVector(x, y);
    len = _len;
    angle=0;
  }
  
  //FUNCTIONS\\
  
  //update our angle based on the mouse position
  void update(){
    //turn the mouse into a pvector in order to use the pvector functions
    PVector destination = new PVector(mouseX, mouseY);
    //subtract the origin from the destination, this is our direction
    PVector direction = PVector.sub(destination, origin);
    //get the angle of the direction
    angle = direction.heading();
  }
  
  //drae the line
  void display(){
    pushMatrix();
    //translate and rotate the line based on the angle
    translate(origin.x, origin.y);
    rotate(angle);
    line(0, 0, len, 0);
    popMatrix();
  }
  
  //function to wrap up both update and display
  void run(){
   update();
   display();
  }
}