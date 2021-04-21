const int ledPin = 6;
long timer = 0;
int timerLength = 500;
bool onOff = false;
 
void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin, OUTPUT);
}
 
void loop() {
  // put your main code here, to run repeatedly:
  if (millis()>timer){
    onOff = !onOff;
    digitalWrite(ledPin, onOff);
    timer = millis() + timerLength;
  }
}
