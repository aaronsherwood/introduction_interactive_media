Ball bouncingBalls[] = new Ball[100];

void setup(){
  size(640,640);
  for (int i = 0; i< bouncingBalls.length; i++){
    bouncingBalls[i] = new Ball(random(width), random(height));
  }
}

void draw(){
  background(255);
  for (int i = 0; i< bouncingBalls.length; i++){
    bouncingBalls[i].run();
  }
}