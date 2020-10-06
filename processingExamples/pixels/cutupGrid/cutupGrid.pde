// from http://www.generative-gestaltung.de/

PImage img;

int tileCountX = 4;
int tileCountY = 4;
int tileCount = tileCountX*tileCountY;
PImage[] imageTiles = new PImage[tileCount];

int tileWidth, tileHeight;

int cropX = 0;
int cropY = 0;

boolean selectMode = true;
boolean randomMode = false; 


void setup() {
  size(1600, 1200); 
  img = loadImage("trust.jpeg");
  image(img, 0, 0, width, height);
  noCursor();

  tileWidth = width/tileCountY;
  tileHeight = height/tileCountX;
}


void draw() {
  if (selectMode == true) {
    // in selection mode, a white selection rectangle is drawn over the image
    cropX = constrain(mouseX, 0, width-tileWidth);
    cropY = constrain(mouseY, 0, height-tileHeight);    
    image(img, 0, 0, width, height);
    noFill();
    stroke(255);
    rect(cropX, cropY, tileWidth, tileHeight);
  } 
  else {
    // reassemble image
    int i = 0;
    for (int gridY = 0; gridY < tileCountY; gridY++){
      for (int gridX = 0; gridX < tileCountX; gridX++){
        image(imageTiles[i], gridX*tileWidth, gridY*tileHeight);
        i++;
      }
    }

  }

}

void cropTiles() {
  tileWidth = width/tileCountY;
  tileHeight = height/tileCountX;
  tileCount = tileCountX * tileCountY;
  imageTiles = new PImage[tileCount];

  int i = 0;
  for (int gridY = 0; gridY < tileCountY; gridY++){
    for (int gridX = 0; gridX < tileCountX; gridX++){
      if (randomMode){
        cropX = (int) random(mouseX-tileWidth/2, mouseX+tileWidth/2);
        cropY = (int) random(mouseY-tileHeight/2, mouseY+tileHeight/2);
      }
      cropX = constrain(cropX, 0, width-tileWidth);
      cropY = constrain(cropY, 0, height-tileHeight);
      imageTiles[i++] = img.get(cropX, cropY, tileWidth, tileHeight);
    }
  }
}


void mouseMoved() {
  selectMode = true;
}

void mouseReleased(){
  selectMode = false; 
  cropTiles();
}



void keyReleased(){

  if (key == 'r' || key == 'R') {
    randomMode = !randomMode;
    tileCountY = tileCountX = int(random(4, 40));
    cropTiles();
  }

  if (key == '1'){
    tileCountY = 4;
    tileCountX = 4;
    cropTiles();
  }
  if (key == '2'){
    tileCountY = 10;
    tileCountX = 10;
    cropTiles();
  }
  if (key == '3'){
    tileCountY = 20;
    tileCountX = 20;
    cropTiles();
  }
}
