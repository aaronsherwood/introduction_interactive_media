#include <Servo.h>
#include "pitches.h"

Servo servo;
int servoPos = 100;
int whichNote = 0;
int notes[10] = {NOTE_C4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_A4, NOTE_B4, NOTE_C5, NOTE_D5, NOTE_E5};
int durations[10];

void setup() {
  servo.attach(2);
  
  Serial.begin(9600);

  // set the durations with a random coinflip
  for (int i = 0; i < 10; i++) {
    int coinFlip = random(2);
    if (coinFlip == 0)
      durations[i] = 8;
    else
      durations[i] = 4;
  }
}

void loop() {
  int val = analogRead(A0);

  // the rate is 1 second divided by the duration of the note
  int rate = 1000 / durations[whichNote];
 
  // get the current time
  unsigned long currentTime = millis();

  // trigger a note
  if (currentTime % rate == 0  ) {
    tone(4, notes[whichNote], random(100, 400));
    whichNote = random(10);
    delay(1);
  }

  // do the servo at half speed
  if (currentTime % (rate * 4) == 0  ) {
    servoPos = 30;
    servo.write(servoPos);
  } 
  
  // else if not triggereing the servo, then every 10 milliseconds move the servo arm back a little bit
  // can't do it every frame as that is too fast for the servo
  else if (currentTime % 10 == 0) {
    servoPos -= 1;
    servo.write(servoPos);
  }
}
