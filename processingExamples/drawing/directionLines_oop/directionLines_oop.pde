// declare an array of DirectionLines
DirectionLine lines[];

void setup() {
  fullScreen();

  //how long will each line be
  int lineLength = 30;

  //we can find out how many lines we will have 
  //by dividing width and height by the lineLength
  int w = width/lineLength;
  int h = height/lineLength;

  //initialize the array with number of total lines
  lines = new DirectionLine[w*h];

  //index to access each element of the array
  int i=0;
  //nested for loop, start at lineLength/2 to offset and center the lines on screen
  //increase each step through the loops by lineLength, to space the lines appropriately
  for (int y=lineLength/2; y<height; y+=lineLength) {
    for (int x=lineLength/2; x<width; x+=lineLength) {
      //access each DirectionLine in the way and create a new DirectionLine object
      //the x & y vairbales from the for loops give us the origin location of each line
      lines[i] = new DirectionLine(x, y, lineLength);
      //be sure to increase i
      i++;
    }
  }
}

void draw() {
  background(255);
  //just loop through all the lines and call run()
  for (int i=0; i<lines.length; i++) {
    lines[i].run();
  }
}