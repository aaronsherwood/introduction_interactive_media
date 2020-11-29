float smoothedNum = 0;
float y = 0;

void setup() {
  size(640, 640);
}

void draw() {
  background(255);
  
  // choose a random height every 10 frames
  if (frameCount%10==0)
    y = random(height);
    
  // draw that
  ellipse(width/4, y, 60, 60);
  
  // smoothing algorithm is: 
  // smoothedValue += (destinationValue - currentSmoothedValue) * someDecimalScalar
  smoothedNum += (y-smoothedNum)*.1;
  
  // draw the smoothed value
  ellipse(width-width/4, smoothedNum, 60, 60);
}
