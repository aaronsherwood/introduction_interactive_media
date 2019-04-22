Circle myCircle;
String s = "Circular"; 

Circle letters[] = new Circle[s.length()];

void setup(){
  size(640, 460);
  int radius = 100;
  textSize(25);
  float startingAngle = PI;//+PI/2;
  float circleCenterX = width/2;
  float circleCenterY = height/2;
  for (int i =0; i<s.length();i++){
     float angle = startingAngle+i*TWO_PI/s.length();
     float x = cos(angle)*radius + circleCenterX;
     float y = sin(angle)*radius + circleCenterY;
     letters[i] = new Circle(x, y, s.charAt(i));
  }

}

void draw(){
  background(255);
  for (int i =0; i<s.length();i++){
     letters[i].update();
     letters[i].display();
     letters[i].checkEdges();
  }
  
}

void mousePressed(){
  for (int i =0; i<s.length();i++){
     letters[i].xSpeed = random(-5,5);
     letters[i].ySpeed = random(-5,5);
  }
}