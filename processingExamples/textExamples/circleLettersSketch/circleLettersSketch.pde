//Circle myCircle;

// a string of text
String s = "Circular stibro "; 

// declare an array of Circle objects, called letters
// set it to be the same size as the length of the String
Letter letters[] = new Letter[s.length()];
PFont f;

void setup(){
  size(640, 460);
  f = createFont("Courier New", 25);
  textFont(f);
 
  // radius of the  circle of letters
  int radius = 100;
  
  // start the words halfway around the circle 
  // (left side. normally in processing circles, angles, and rotations 
  // start on the right side) 
  float startingAngle = PI;
  
  // where is the center of the circle
  float circleCenterX = width/2;
  float circleCenterY = height/2;
  
  // loop through all the characters in the String
  for (int i =0; i<s.length();i++){
     // the get the angle using i as a multiplier
     float angle = startingAngle + i*TWO_PI/s.length();
     
     // cosine of an angle equals adjacent/hypoteneuse 
     // thus: cos(angle) = x/radius 
     // and algebra: x = cos(angle)*radius
     float x = cos(angle)*radius + circleCenterX;
     // y is same but sine
     float y = sin(angle)*radius + circleCenterY;
     
     //make a new Circle object for each letter
     letters[i] = new Letter(x, y, s.charAt(i));
  }
}

void draw(){
  background(255);
  // loop through the letters array and call all needed functions
  for (int i =0; i<s.length();i++){
     letters[i].update();
     letters[i].display();
     letters[i].checkEdges();
  }  
}

// when the mouse is pressed assign a random x & y speed
void mousePressed(){
  for (int i =0; i<s.length();i++){
     letters[i].xSpeed = random(-5,5);
     letters[i].ySpeed = random(-5,5);
  }
}
