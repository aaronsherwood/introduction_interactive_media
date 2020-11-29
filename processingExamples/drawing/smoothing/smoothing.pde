float smoothedNum = 0;
float y = 0;
void setup() {
  size(640, 640);
}

void draw() {
  background(255);
  if (frameCount%10==0)
    y = random(height);
  ellipse(width/4, y, 30, 30);
  smoothedNum += (y-smoothedNum)*.1;
  ellipse(width-width/4, smoothedNum, 30, 30);
}
