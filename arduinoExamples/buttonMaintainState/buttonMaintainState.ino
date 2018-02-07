//set global variables
int ledPin = 2;
int button = 3;
bool onOff = false;
bool prevButtonState = LOW;

void setup() {
  // set pinmodes
  pinMode(ledPin, OUTPUT);
  pinMode(button, INPUT);
}

void loop() {
  //read our button & store it in a boolean variable
  bool currButtonState = digitalRead(button);

  //if the button is pressed AND it wasn't pressed last frame
  //then flip onOff to its opposite
  //we want to make sure we don't keep flipping on & off while the button is pressed
  //checking the previous time let's us only flip it once
  if (currButtonState == HIGH && prevButtonState == LOW) {
    onOff = !onOff;
  }

  //turn our LED on & off based on our global onOff state
  digitalWrite(ledPin, onOff);

  //set the previous button state to our current state,
  //so next time through loop it will actually be the previous state
  prevButtonState = currButtonState;
}
