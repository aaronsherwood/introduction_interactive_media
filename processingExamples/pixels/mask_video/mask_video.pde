import processing.video.*;
Capture video;

PGraphics noise, mask;

void setup() {
  size(640, 480); 
  
  video = new Capture(this, 640, 480);
  video.start();
  
  noise = createGraphics(640, 480);
  noise.beginDraw();
  noise.background(0);
  noise.endDraw();

  mask = createGraphics(640, 480);
  mask.beginDraw();
  mask.background(0);
  mask.endDraw(); 
}

void draw() {
  background(0);
  
  if (video.available()) {
    video.read();
  }
  
  noise.loadPixels();
  for (int i=0; i<noise.pixels.length; i++) {
    noise.pixels[i]=color(random(255));
  }
  noise.updatePixels();
  
  mask.beginDraw();
  mask.background(0);
  mask.noStroke();
  mask.fill(255);
  mask.ellipse(mouseX, mouseY, 100, 100);
  mask.endDraw();
  
  video.mask(mask);
  
  image(noise,0,0);
  image(video, 0, 0);
}
