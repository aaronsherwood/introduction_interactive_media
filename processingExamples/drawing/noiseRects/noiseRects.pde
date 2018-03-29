int mode = 0;

void setup() {
  size(640, 360);
  
  noFill();
  stroke(0, 50);
  rectMode(CENTER);
}

void draw() {
  background(255);
  noiseSeed(0);
  randomSeed(0);
  //choose between modes 1,2,3,4,5
  mode(mode);
}

void keyPressed(){
  if (key=='1'){
    mode=1;
  }
  if (key=='2'){
    mode=2;
  }
  if (key=='3'){
    mode=3;
  }
  if (key=='4'){
    mode=4;
  }
  if (key=='5'){
    mode=5;
  }
}