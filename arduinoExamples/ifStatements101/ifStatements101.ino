const int ledPin = 2;
const int button = 3;
bool timeToTurnOn = true; //just for example, see below

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin, OUTPUT);
  pinMode(button, INPUT);
  //begin our serial communication
  Serial.begin(9600);
}

void loop() {
  // get our button state
  bool buttonState = digitalRead(button);

  //print out our button state
  Serial.print("Button state: ");
  Serial.println(buttonState);

  //HOW TO TURN ON OUR LED
  
  //simplest version - just send in the state of our button to digitalWrite
  digitalWrite(ledPin, buttonState);

  //slightly more complex
  //if only one line after if statement you don't need curly brackets
  //also, when seeing if something is true you don't have to say < if (buttonState==true) >, shorthand is to just say < if (buttonState) >
  if (buttonState) 
    digitalWrite(ledPin, HIGH);
  else
    digitalWrite(ledPin, LOW);

  //slightly less complicated
  if (buttonState == HIGH) {
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);
  }

  //most complicated version
  if (buttonState == HIGH) {
    digitalWrite(ledPin, HIGH);
  } else if (buttonState == LOW) {
    digitalWrite(ledPin, LOW);
  } else if (timeToTurnOn){
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);
  }
}
