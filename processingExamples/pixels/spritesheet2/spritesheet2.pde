PImage spritesheet;
PImage[] sprites;
int direction = 1; // 0 up
int step = 0;
int x;
int y;
int speed = 3;

void setup() {
  size(1280, 720);
  spritesheet = loadImage("runningcat.png");
  sprites = new PImage[8]; // 2 images across, 4 down, in the spritesheet

  int w = spritesheet.width/2;
  int h = spritesheet.height/4;

  int index = 0;
  for (int y=0; y < 4; y++) {
    for (int x=0; x< 2; x++) {
      sprites[index] = spritesheet.get(x*w, y*h, w, h);
      index++;
    }
  }

  x = width/2;
  y = height/2;
  
  imageMode(CENTER);
}

void draw() {
  background(255);

  //look at sprite sheet to determine which direction is which
  if (keyPressed) {
    if (keyCode == LEFT) {
      direction = -1;
   
    }
    if (keyCode == RIGHT) {
      direction = 1;
  
    }
    if (frameCount%speed==0) {
      step = (step+1) % 8;
    }
  }
  translate(width/2, height/2);
  scale(direction,1);
  image(sprites[step], 0,0);
}
