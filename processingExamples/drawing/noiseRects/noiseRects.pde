
size(640, 360);

background(255);
noFill();
noiseSeed(0);
stroke(0,50);
int sections=width/300;
for (int i=0; i<width; i+=sections) {
  println(i);
  pushMatrix();
  float noiseValue=noise(i*.01);
  translate(i,noiseValue*250);
  rotate(noiseValue);
  rect(0, 0,2, 100);
  popMatrix();
}