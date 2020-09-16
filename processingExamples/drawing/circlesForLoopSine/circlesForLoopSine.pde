float speed = .005;
float baseDiameter = 128;
float waveSize = 64;
int howManyCirclesX = 20;
int howManyCirclesY = 5;


void setup(){
  size(640, 640); 
}

void draw(){
  fill(255,25);
  noStroke();
  rect(0,0,640,640);
  
  noFill();
  stroke(0,50);
  
  // set how rows there are via the mouse X position
  // limit to 1 <-> 10 by dividing by 64 (640/64=10)
  // uncomment below to try out
  
  //howManyCirclesY = mouseX/64+1;
  
  // make the for loop easy to read
  // if we want 5 circles on screen we need to take width (640) and divide by 5 to place a circle every 128 pixels
  int limitX = width/howManyCirclesX;
  int limitY = height/howManyCirclesY;
  
  // offset the circles by half their size to center them on screen
  for (int y = limitY/2; y<height; y+=limitY){
    for (int x = limitX/2; x<width; x+=limitX){
      
      // create a sine wave, adjusting the frequency based on our speed and x position
      float wave = sin(frameCount*speed+x);
      
      // change the range of the sine wave from -1 <-> 1 to 0 <-> 2
      wave += 1;
      
      // change the range again by increasing the amplitude with multiplication
      // now the range is between 0 <-> 128 (i.e., 2*64)
      wave *= waveSize;
      
      // have a starting point with the baseDiameter
      ellipse(x,y,baseDiameter+wave,baseDiameter+wave);
    }
  }
}
