PImage img;
PImage[] tiles;

int tileSize = 400;

void setup() {
  fullScreen();
  img = loadImage("aiweiwei.jpeg");
  tiles = new PImage[img.height/tileSize];
  for (int i=0; i< tiles.length; i++) {
    tiles[i] = img.get(int(random(img.width-tileSize)), int(random(img.height-tileSize)), tileSize, tileSize);
  }
  imageMode(CENTER);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  image(tiles[(int)random(tiles.length)], 0, 0);
  int numCircles = 4;
  for (int j = 0; j < numCircles; j++) {
    int amount = 10*(j+1);
    float div = TWO_PI/amount;
    int whichImage = (int)random(tiles.length);
    for (int i = 0; i< amount; i++) {
      float x = cos(div*i)*tileSize*j;
      float y = sin(div*i)*tileSize*j;
      pushMatrix();
      translate(x, y);
      rotate(div*i);
      image(tiles[whichImage], 0, 0);
      popMatrix();
    }
  }

  popMatrix();
  noLoop();
}

void keyPressed() {
  loop();
}
