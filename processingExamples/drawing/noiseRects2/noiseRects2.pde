//width of each rectangle
int w = 8;
float speed = .01;
float granulation = .001;

void setup(){
  size(640, 480);
  rectMode(CENTER);
}

void draw(){
  background(255);
  //noise adjusting height of the rectangles
  for (int i=0; i<width; i+=w){
    //the slower the frequency the smoother the noise
    //use i to individuate each rectangle
    //scale i down some
    //then change over time with scaled down version of frameCount
    float frequency = (frameCount*speed) + (i*granulation);
    float amp = 100;
    //noise outputs between 0 & 1
    float adjustedNoise = noise(frequency)-.5; //make it so it gives us numbers between -.5 and .5
    float heightAdjustment = adjustedNoise * amp;
    rect(i+w/2, height*.25 + heightAdjustment, w, 100);
  }
  
  //noise adjusting rotation of the rectangles
  for (int i=0; i<width; i+=w){
    float frequency = (frameCount*speed) + (i*granulation);
    //map noise from 0-1 to 0-TWO_PI to get an angle around a circle
    float angle = map(noise(frequency), 0, 1, 0, TWO_PI);
    pushMatrix();
    translate(i+w/2, height-height*.25);
    rotate(angle);
    rect(0,0, w, 100);
    popMatrix();
  }
}