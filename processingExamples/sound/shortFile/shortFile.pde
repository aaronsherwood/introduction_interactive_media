import processing.sound.*;

SoundFile[] sounds;
SoundFile currentFile;
int hue = 360;

void setup() {
  size(200, 200);

  sounds = new SoundFile[5];
  for (int i = 0; i < 5; i++) {
    sounds[i] = new SoundFile(this, (i) + ".aif");
  }
  currentFile = sounds[(int)random(5)];
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  if (currentFile.isPlaying()) {
    background(hue, 100, 100);
  }
}

void mousePressed() {
  // uncomment and comment one or the other to try the different ways of doing it

  // PATTERN ONE: wait until current file is finished then retrigger
  if (!currentFile.isPlaying()) {
    currentFile = sounds[(int)random(5)];
    currentFile.play();
    hue =(int)random(360);
  }

  //// PATTERN TWO: stop current file and then retrigger
  //currentFile.stop();
  //currentFile = sounds[(int)random(5)];
  //currentFile.play();
  //hue =(int)random(360);
}
