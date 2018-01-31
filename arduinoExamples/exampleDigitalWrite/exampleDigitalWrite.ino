int ledPin = 2;
int button = 7;
bool onOff = false;
bool prevButtonState = LOW;

void setup() {
  // put your setup code here, to run once:
  // set pin to be output
  pinMode(ledPin, OUTPUT);
  pinMode(button, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  bool currButtonState = digitalRead(button);

  if (currButtonState == HIGH && prevButtonState == LOW) {
    onOff = !onOff;
  }


  digitalWrite(ledPin, onOff);

  prevButtonState = currButtonState;
}
