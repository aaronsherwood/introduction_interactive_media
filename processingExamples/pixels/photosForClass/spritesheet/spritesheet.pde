PImage spritesheet;
PImage[][] sprites;
int direction = 1; // 0 up
int step = 0;
int x;
int y;
int speed = 3;

void setup() {
  fullScreen();
  spritesheet = loadImage("walking.png");
  sprites = new PImage[4][12]; // 12 images across, 4 down, in the spritesheet

  int w = spritesheet.width/12;
  int h = spritesheet.height/4;

  for (int y=0; y < 4; y++) {
    for (int x=0; x< 12; x++) {
      sprites[y][x] = spritesheet.get(x*w, y*h, w, h);
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
    if (keyCode == DOWN) {
      direction = 0;
      y+=speed;
    }
    if (keyCode == LEFT) {
      direction = 1;
      x-=speed;
    }
    if (keyCode == RIGHT) {
      direction = 2;
      x+=speed;
    }
    if (keyCode == UP) {
      direction = 3;
      y-=speed;
    }
    if (frameCount%speed==0) {
      step = (step+1) % 12;
    }
  }

  image(sprites[direction][step], x, y);
}
