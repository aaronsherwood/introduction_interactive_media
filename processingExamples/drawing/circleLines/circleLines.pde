LineCircle circle1, circle2, circle3, circle4;
float smoothedMouseX=0;
float smoothedMouseY=0;

void setup() {
  size(640, 480);
  noFill();
  int radius = 100;
  int numLines = 100;
  circle1 = new LineCircle(width/2-radius, height/2-radius, numLines, radius);
  circle2 = new LineCircle(width/2+radius, height/2-radius, numLines, radius);
  circle3 = new LineCircle(width/2-radius, height/2+radius, numLines, radius);
  circle4 = new LineCircle(width/2+radius, height/2+radius, numLines, radius);
}

void draw() {
  background(255);
  strokeWeight(2);
  stroke(0, 100);
  circle1.draw();
  circle2.draw();
  circle3.draw();
  circle4.draw();
  smoothedMouseX+=(mouseX-smoothedMouseX)*.1;
  smoothedMouseY+=(mouseY-smoothedMouseY)*.1;
}

void mousePressed() {
  circle1.checkInside(mouseX, mouseY);
  circle2.checkInside(mouseX, mouseY);
  circle3.checkInside(mouseX, mouseY);
  circle4.checkInside(mouseX, mouseY);
}