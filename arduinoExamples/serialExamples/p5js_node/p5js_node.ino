// P5 code for this is here: https://editor.p5js.org/aaronsherwood/sketches/v8OM9VbGe

void setup() {
  Serial.begin(9600);
  pinMode(2, OUTPUT);
  pinMode(5, OUTPUT);
  while (Serial.available() <= 0) {
    Serial.println("0,0"); // send a starting message
    delay(300);              // wait 1/3 second
  }
}

void loop() {

  while (Serial.available() > 0) {
    // read the incoming byte:
   char inByte = Serial.read();
    
    switch (inByte) {
      case '0':
        digitalWrite(2, LOW);
        digitalWrite(5, LOW);
        break;
      case '1':
        digitalWrite(2, HIGH);
        break;
      case '2':
        digitalWrite(5, HIGH);
        break;
    }

    int sensorValue = analogRead(A0);
    Serial.print(sensorValue);
    Serial.print(",");
    sensorValue = analogRead(A1);
    Serial.print(sensorValue);
    Serial.println();
  }
}
