PImage img;

void setup(){
  size(640, 640);
  img = loadImage("baboon.png");
}

void draw(){
  image(img, 0, 0, width, height);
}
