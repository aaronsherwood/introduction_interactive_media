int data[];

void setup() { 
  size(480, 270);
  // The text from the file is loaded into an array. 
  String[] stuff = loadStrings("data.txt");
  // This array has one element because the file only has one line. 
  // Convert String into an array of integers using ',' as a delimiter

  //string array is returned, which we cast to an int array
  data = int(split(stuff[0], ',' ));
}

void draw() {
  background(255);
  stroke(0);
  float w = width/data.length;
  println(w);
  for (int i = 0; i < data.length; i ++ ) {
    // The array of ints is used to set the color and height of each rectangle.
    fill(data[i]); 
    rect(i*w, height-data[i], i+w, height);
  }
}