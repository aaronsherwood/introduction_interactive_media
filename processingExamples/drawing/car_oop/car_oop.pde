Car car;
Car[] cars;


void setup() {
  fullScreen();
  rectMode(CENTER);
  car = new Car(color(random(255), random(255), random(255)));
  cars = new Car[50];
  for (int i=0; i<cars.length; i++){
    cars[i] = new Car(color(random(255), random(255), random(255)));
  }
}

void draw() {
  background(255);
  car.run(true);
 
  for (int i = 0; i<cars.length; i++){
    cars[i].run(false); 
  }
}

void keyPressed(){
  car.addForce(5); 
}
