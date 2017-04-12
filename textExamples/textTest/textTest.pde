PFont f;
color red;
float x,y;

String message= "fooooood";

void setup(){
  size(640,360);
  f = createFont("FranklinGoth-ExtCondensed", 32);
  red=color(255,0,0);
  x=width;
  y=height/2;
}

void draw(){
  background(255);
  //which font
  textFont(f,32);
  //color
  fill(red);
  textAlign(LEFT);
  text(message,x,y);
  x-=1;
  if (x<0-textWidth(message))
    x=width;
  //for (int i=0; i<message.length(); i++){
  //  char c = message.charAt(i);
  //  float letterX=x+textWidth(c)*(i-1);
  //  text(c,letterX+random(-3,3),y+random(-3,3));
  //}
}