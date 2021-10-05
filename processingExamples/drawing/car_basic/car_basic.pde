float posX, posY;
float carWidth, carHeight;
color carColor;
float wheelWidth, wheelHeight;
float speed;

void setup() {
  size(1280, 720);
  //setup the car
  rectMode(CENTER);
  posX = width/2;
  posY = height/2;
  carWidth = 100;
  carHeight = carWidth/2.5;
  carColor = color(255,0,0);
  wheelWidth = carWidth * .2;
  wheelHeight = wheelWidth/2.5;
}

void draw() {
  background(255);
  
  //car body
  fill(carColor);
  noStroke();
  rect(posX, posY, carWidth, carHeight);
  
  fill(0);
  //left top wheel
  rect(posX-carWidth/2 + wheelWidth/2, posY - carHeight/2-wheelHeight/2, wheelWidth, wheelHeight);
  //right top wheel
  rect(posX+carWidth/2 - wheelWidth/2, posY - carHeight/2-wheelHeight/2, wheelWidth, wheelHeight);
  //left bottom wheel
  rect(posX-carWidth/2 + wheelWidth/2, posY + carHeight/2+wheelHeight/2, wheelWidth, wheelHeight);
  //right bottom wheel
  rect(posX+carWidth/2 - wheelWidth/2, posY + carHeight/2+wheelHeight/2, wheelWidth, wheelHeight);
  
  //drive the car
  posX += 10;
  
  if (posX > width+carWidth/2) {
    posX = -carWidth/2;
  }
}
