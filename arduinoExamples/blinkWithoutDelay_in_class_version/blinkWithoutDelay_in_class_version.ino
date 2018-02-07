//set global variables
int ledPin = 2;
int button = 3;
bool onOff = false;
bool prevButtonState = LOW;
int blinkRate = 20000;
bool isLEDon = LOW;
unsigned long nextBlinkTime = 0;


void setup() {
  // set pinmodes
  pinMode(ledPin, OUTPUT);
  pinMode(button, INPUT);

  Serial.begin(9600);
}

void loop() {
  bool currButtonState = digitalRead(button);

  if (currButtonState == HIGH && prevButtonState == LOW) {
    onOff = !onOff;
  }

  //get the current time
  unsigned long currentTime = millis();

  Serial.print("Current time: ");
  Serial.print(currentTime);
  Serial.print(" Next Blink Time: ");
  Serial.println(nextBlinkTime);
  
  if (currentTime > nextBlinkTime){
    isLEDon = !isLEDon;
    nextBlinkTime = currentTime + blinkRate;
  }

    if (onOff){
      digitalWrite(ledPin, isLEDon);
    } else {
      digitalWrite(ledPin, LOW);
    }
  
  prevButtonState = currButtonState;
}
