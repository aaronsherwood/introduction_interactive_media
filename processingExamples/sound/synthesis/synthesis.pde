import processing.sound.*;

float oFreq=midiToFreq(95);
float freq=oFreq;
SinOsc sine;
TriOsc tri;
PinkNoise noise;
Env env, env1, env2;
float attackTime = 0.001;
float sustainTime = 0.04;
float sustainLevel = 0.3;
float releaseTime = 0.02;
int speed=150; // higher numbers are slower
int trigger;
SoundFile soundfile;
int counter = 0;
int backgroundHue = 255;
float[] lineWidths = {.2, .2, .2};
float[] yLocs = new float[3];

//remember larger numbers are smaller lines
float maxWidth = 0.05;
float minWidth = .1;

void setup() {
  size(640, 480);
  initialize();
  noStroke();

  for (int i=0; i<yLocs.length; i++) {
    // to get 3 lines we need to divide the screen into 4
    yLocs[i] = height/4+ height/4*i;
  }

  blendMode(ADD);
}

void draw() {
  rhythm();
  visuals();
}

void visuals() {
  loadPixels();
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      float[] d = {0, 0, 0};
      for (int i=0; i<lineWidths.length; i++) {
        d[i] = abs(y-yLocs[i]);
        if (d[i]>0)d[i]=1/d[i];
        else d[i]=1;
        d[i] = map(d[i], 0, lineWidths[i], 0, 255);
      }
      pixels[x+y*width]=color((d[0]+d[1]+d[2])*.9, (d[0]+d[1]+d[2])*.5, (d[0]+d[1]+d[2])*.3);
    }
  }
  updatePixels();

  for (int i=0; i<lineWidths.length; i++) {
    //remember larger numbers are smaller lines
    lineWidths[i] = constrain(lineWidths[i], maxWidth, minWidth);
    lineWidths[i] += 0.1;
  }

  // somehow 1 lines up
  if (counter==1) backgroundHue = 255;
  backgroundHue--;
  fill(255, backgroundHue);
  rect(0, 0, width, height);
}

void initialize() {
  sine = new SinOsc(this);
  tri = new TriOsc(this);
  noise = new PinkNoise(this);
  noise.amp(.15);
  trigger=millis();
  env  = new Env(this);
  env1  = new Env(this);
  env2  = new Env(this);
}

void rhythm() {
  if (counter==0) {
    freq=oFreq;
  }
  if (millis()>trigger) {
    trigger=millis()+speed;
    if (counter%2==0) {
      // freq and amplitude
      sine.play(midiToFreq(31), 0.5);
      env.play(sine, attackTime, sustainTime, sustainLevel, releaseTime);
      lineWidths[0]=maxWidth;
    }
    if (counter%(int)random(1, 5)==0) {
      sine.play(freq, .08);
      env1.play(sine, attackTime, sustainTime, sustainLevel, releaseTime);
      noise.play();
      env1.play(noise, attackTime, sustainTime, sustainLevel, releaseTime);
      lineWidths[1]=maxWidth;
    }
    if (counter%3==0) {
      tri.play(100, 1);
      env2.play(tri, attackTime, sustainTime, sustainLevel, releaseTime);
      lineWidths[2]=maxWidth;
    }
    freq-=5;
    counter=(counter+1)%48;
  }
}

float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}
