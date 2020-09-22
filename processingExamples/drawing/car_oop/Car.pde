class Car {
  float posX, posY;
  float carWidth, carHeight;
  color carColor;
  float wheelWidth, wheelHeight;
  float acceleration;
  float velocity;
  float speed;

  Car(color c) {
    posX = random(width);
    posY = random(height);
    carWidth = random(75, 150);
    carHeight = carWidth/2.5;
    carColor = c;
    wheelWidth = carWidth * .2;
    wheelHeight = wheelWidth/2.5;
    velocity = 0;
    acceleration = random(2, 15);
    speed = acceleration;
  }

  void drawCar() {
    fill(carColor);
    noStroke();
    rect(posX, posY, carWidth, carHeight);
  }

  void drawWheels() {
    fill(0);
    //left top wheel
    rect(posX-carWidth/2 + wheelWidth/2, posY - carHeight/2-wheelHeight/2, wheelWidth, wheelHeight);
    //right top wheel
    rect(posX+carWidth/2 - wheelWidth/2, posY - carHeight/2-wheelHeight/2, wheelWidth, wheelHeight);
    //left bottom wheel
    rect(posX-carWidth/2 + wheelWidth/2, posY + carHeight/2+wheelHeight/2, wheelWidth, wheelHeight);
    //right bottom wheel
    rect(posX+carWidth/2 - wheelWidth/2, posY + carHeight/2+wheelHeight/2, wheelWidth, wheelHeight);
  }

  void addForce(float force) {
    acceleration += force;
  }

  void moveCarInteractive() {
    velocity += acceleration;
    posX += velocity;
    velocity *= .9;
    acceleration *=0;
  }

  void moveCar() {
    posX += acceleration;
  }

  void checkEdge() {
    if (posX > width+carWidth/2) {
      posX = -carWidth/2;
    }
  }

  void run(boolean interactive) {
    if (interactive==true){
    moveCarInteractive();
    } else {
      moveCar();
    }
    drawCar();
    drawWheels();
    checkEdge();
  }
}
