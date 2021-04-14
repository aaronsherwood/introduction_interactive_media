void setup() {
  Serial.begin(9600);
  Serial.println("0");
  pinMode(2, OUTPUT);
}

void loop() {
  while (Serial.available()) {
    byte bounce = Serial.parseInt();
    if (Serial.read() == '\n') {
      digitalWrite(2, bounce);
      int sensor = analogRead(A0);
      Serial.println(sensor);
    }
  }
}

/*

import processing.serial.*;
Serial myPort;

boolean onOff=false;

PVector velocity;
PVector gravity;
PVector position;
PVector acceleration;
PVector wind;
float drag = 0.99;
float mass = 50;
float hDampening;
long ledOnTimer = 0;

void setup() {
  size(640, 360);
  printArray(Serial.list());
  String portname=Serial.list()[5];
  println(portname);
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');

  position = new PVector(width/2, 0);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  gravity = new PVector(0, 0.5*mass);
  wind = new PVector(0, 0);
  hDampening=map(mass, 15, 80, .98, .96);
}

void draw() {
  background(255);

  velocity.x*=hDampening;

  applyForce(wind);
  applyForce(gravity);
  velocity.add(acceleration);
  velocity.mult(drag);
  position.add(velocity);
  acceleration.mult(0);
  ellipse(position.x, position.y, mass, mass);
  
  if (position.y > height-mass/2) {
    velocity.y *= -0.9;  // A little dampening when hitting the bottom
    position.y = height-mass/2;
    onOff=true;
    ledOnTimer = millis()+100;
  }
  
  if (millis() > ledOnTimer){
   onOff=false; 
  }
}

void applyForce(PVector force) {
  // Newton's 2nd law: F = M * A
  // or A = F / M
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}

void serialEvent(Serial myPort) {
  String s=myPort.readStringUntil('\n');
  s=trim(s);
  if (s!=null) {
    println(s);
    int values[]=int(split(s, ','));
    if (values.length==1) {
      wind.x=(float)map(values[0], 0, 1023, 10, -10);
    }
  }
  myPort.write(int(onOff)+"\n");
}

void keyPressed() {
  if (key==' ') {
    mass=random(15, 80);
    position.y=-mass;
    velocity.mult(0);
  }
}


 */
