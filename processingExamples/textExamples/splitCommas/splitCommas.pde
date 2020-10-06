int data[];

void setup() { 
  size(480, 270);
  // The text from the file is loaded into an array. 
  String stuff[] = loadStrings("data.csv");
  // This array has one element because the file only has one line. 
  println(stuff.length);
  // Convert String into an array of integers using ',' as a delimiter
  // string array is returned, which we cast to an int array
  data = int( split(stuff[0], ',' ) );
  // print out the array of data
  printArray(data);
  noStroke();
}

void draw() {
  background(255);
  float w = width/data.length;
  for (int i = 0; i < data.length; i ++ ) {
    // The array of ints is used to set the color and height of each rectangle.
    fill(data[i],0,0); 
    rect(i*w, height-data[i], w, data[i]);
  }
}
