PFont f;
color red;
float x,y;
ArrayList<Letter> letters = new ArrayList<Letter>();
float globalWind=0;
int index=0;
String [] message = {"Let's eat!!", "Fooooooood.....", "NOW"};
int fontSize = 64;

void setup(){
  size(640,360);
  f = createFont("courier", fontSize);
  textAlign(LEFT);
  textFont(f,fontSize);
  red=color(255,0,0);
  createLetters(message[index]);
}

void draw(){
  background(255);

  fill(red);

  for (int i=0; i<letters.size(); i++){
    letters.get(i).update();
    letters.get(i).display();
  }
  if (!keyPressed)
    globalWind=0;
}

void createLetters(String word){
  x=width/2-(textWidth(word)/2);
  y=height/2;
  for (int i=0; i<word.length(); i++){
    char c = word.charAt(i);
    float letterX=x+textWidth(c)*(i);
    PVector start= new PVector(letterX,0);
    letters.add(new Letter(start, textWidth(c), c));
  }
}

void keyPressed(){
  if (keyCode==LEFT){
    globalWind=-1;
  }
  if (keyCode==RIGHT){
    globalWind=1;
  }
  if (key==' '){
    letters.clear();
    index=(index+1)%3;
    createLetters(message[index]);
  }
}