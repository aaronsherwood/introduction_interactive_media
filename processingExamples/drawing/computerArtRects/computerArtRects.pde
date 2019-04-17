int rectWidth;
int smallRectDim = 20; // width & height of the smallest rectangle

void setup() {
  size(644, 460);
  rectWidth = width/7;
  noFill();
}

void draw() {
  background(255);
  drawLines();
  for (int y=0; y<height; y+= height/5) {
    for (int x=0; x<width; x+= rectWidth) {
      drawRects(x, y);
    }
  }
  noLoop();
}

void drawRects(int x, int y) {
  //how many rects will we have
  int howMany = (int)random(1, 10);
  
  //translate to the current sub-section of the screen
  pushMatrix();
  translate(x, y);

  //center of the square minus half of the smallest rect, 
  //since we are drawing using CORNER rectMode
  //i.e. 92/2=46 ----> 46-(20/2)=36 
  //this is where to draw a 20x20 rectangle ----> rect(36,36,20,20);
  //if you want to position it in the center of the screen
  int center = rectWidth/2-smallRectDim/2;
  
  //choose where does the small square starts, 
  //somewhere around the center with a spread of 15 on either side
  float smallStart = random(center-15, center+15);

  //what is the size of the spacing between the left side and the beginning of each rect
  //to create equal spacing
  float leftSpacing = smallStart / howMany;
  
  //what is the size of spacing between the right side and the end of each rect
  //to create equal spacing
  float rightSpacing = (rectWidth-(smallStart+smallRectDim)) / howMany;

  for (int i=0; i<howMany; i++) {
    //translate to where the small square starts
    pushMatrix();
    translate(smallStart, smallStart);
    
    //subtract from the x and y coordinate each time the left spacing times i
    float pos = -i*leftSpacing;
  
    // the size of the rect will always be the size of the small square
    //plus the left and right spacings times i
    float dim = smallRectDim+(leftSpacing+rightSpacing)*i;
    
    //random stroke weight
    strokeWeight(random(.5,1.5));
    rect(pos, pos, dim, dim) ; 
    popMatrix();
  }
  popMatrix();
}

//draw the lines for the grid
void drawLines() {
  for (int y=height/5; y<height; y+=height/5) {
    line(0, y, width, y);
  }
  for (int x=width/7; x<width; x+=width/7) {
    line(x, 0, x, height);
  }
}

void keyPressed() {
  if (key==' ')
    loop();
}