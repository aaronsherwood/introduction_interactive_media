PVector locs[] = new PVector[8000];
float xInc = 0.1;
float yInc = 0.7;

void setup() {
  size(640, 480);
  for (int i=0; i< locs.length; i++) {
    locs[i] = new PVector(random(width), random(height));
  }
  background(255);
  stroke(0, 5);
  noFill();
}

void draw() {
  for (int i=0; i< locs.length; i++) {
    float change = frameCount *.01; // add this as 3rd aargument to noise to change over time
    
    locs[i].x += (noise(locs[i].x*.01+TWO_PI, locs[i].y*.01)-.5)*5;
    locs[i].y += (noise(locs[i].y*.01-TWO_PI, locs[i].x*.01)-.5)*5;
    
    if (locs[i].x<0)
      locs[i].x = width;
    if (locs[i].x>width)
      locs[i].x = 0;
    if (locs[i].y<0)
      locs[i].y = height;
    if (locs[i].y>height)
      locs[i].y = 0;
      
    point(locs[i].x, locs[i].y);
  }
}

void keyPressed() {
  noiseSeed((long)random(10000)); 
  for (int i=0; i< locs.length; i++) {
    locs[i] = new PVector(random(width), random(height));
  }
  background(255);
}