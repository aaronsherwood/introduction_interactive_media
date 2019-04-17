int x=0;
int y=0;

void setup(){
 size(604, 480); 
}

void draw(){
  background(255);
  //draw the eyes
  drawEye(width/2-100, height/2);
  drawEye(width/2+100, height/2);
}

void drawEye(int x, int y){
  //draw the outline
  //push and pop the style so that it doesn't affect things later on
  pushStyle();
  noFill();
  ellipse(x, y, 100, 100);
  popStyle();
  
  //get the direction of the eye coords towards the X using subtraction
  int directionX = mouseX-x;
  int directionY = mouseY-y;
  
  //turn that into a PVector so we can use PVector functions such as mag and setMag
  PVector direction = new PVector(directionX, directionY);
  // if the length of the vector is longer than 20, clip it to 20
  if(direction.mag()>20)
    direction.setMag(20);
  
  //draw the pupil
  pushMatrix();
  translate(x, y);
  fill(0);
  ellipse(direction.x,direction.y,50,50);
  popMatrix();
}