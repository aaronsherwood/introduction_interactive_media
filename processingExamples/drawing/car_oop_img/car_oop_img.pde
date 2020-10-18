Car car;
Car[] cars;
PImage[] imgs;


void setup() {
  imgs = new PImage[2];
  imgs[0] = loadImage("car.png");
  imgs[1] = loadImage("bmw.png");
  fullScreen();
  rectMode(CENTER);
  //my car
  car = new Car(color(random(255), random(255), random(255)), imgs[1]);
  
  //automated cars
  cars = new Car[50];
  for (int i=0; i<cars.length; i++){
    cars[i] = new Car(color(random(255), random(255), random(255)), imgs[0]);
  }
  imageMode(CENTER);
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
