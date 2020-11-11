#include "pitches.h"

int notes[10] = {NOTE_C4,NOTE_D4,NOTE_E4,NOTE_F4,NOTE_G4,NOTE_A4,NOTE_B4,NOTE_C5, NOTE_D5, NOTE_E5}; 
int durations[10];

int whichNote = 0;
int speakerPin = 4;

void setup() {
  Serial.begin(9600);
  for (int i=0; i<10; i++){
    int coinFlip = random(2);
    
    if (coinFlip == 0)
      durations[i] = 8;
    else
      durations[i] = 4;
  }
}

void loop() {
  int rate = 1000/durations[whichNote];
 
  if (millis() % rate == 0) {
    tone(speakerPin, notes[whichNote], random(100,400));
    whichNote = random(10);
    delay(1);
  }

}
