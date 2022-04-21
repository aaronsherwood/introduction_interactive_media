let rVal = 0;
let alpha = 255;
let left = 0;
let right = 0;

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  textSize(18);
}

function draw() {
  // one value from Arduino controls the background's red color
  background(map(rVal, 0, 1023, 0, 255), 255, 255);

  // the other value controls the text's transparency value
  fill(255, 0, 255, map(alpha, 0, 1023, 0, 255));
  
  if (!serialActive) {
    text("Press Space Bar to select Serial Port", 20, 30);
  } else {
    text("Connected", 20, 30);
  }

  // click on one side of the screen, one LED will light up
  // click on the other side, the other LED will light up
  if (mouseIsPressed) {
    if (mouseX <= width / 2) {
      left = 1;
    } else {
      right = 1;
    }
  } else {
    left = right = 0;
  }
}

function keyPressed() {
  if (key == " ") {
    // important to have in order to start the serial connection!!
    setUpSerial();
  }
}

function readSerial(data) {
  ////////////////////////////////////
  //READ FROM ARDUINO HERE
  ////////////////////////////////////
  
  if (data != null) {
    // make sure there is actually a message
    // split the message
    let fromArduino = split(trim(data), ",");
    // if the right length, then proceed
    if (fromArduino.length == 2) {
      // only store values here
      // do everything with those values in the main draw loop
      rVal = fromArduino[0];
      alpha = fromArduino[1];
    }

    //////////////////////////////////
    //SEND TO ARDUINO HERE (handshake)
    //////////////////////////////////
    let sendToArduino = left + "," + right + "\n";
    writeSerial(sendToArduino);
  }
}

//Arudino Code
/*
void setup() {
  Serial.begin(9600);
  pinMode(2, OUTPUT);
  pinMode(5, OUTPUT);
  // start the handshake
  while (Serial.available() <= 0) {
    Serial.println("0,0"); // send a starting message
    delay(300);            // wait 1/3 second
  }
}

void loop() {
  // wait for data from p5 before doing something
  while (Serial.available()) {
    int left = Serial.parseInt();
    int right = Serial.parseInt();
    if (Serial.read() == '\n') {
      digitalWrite(2, left);
      digitalWrite(5, right);
      int sensor = analogRead(A0);
      delay(1);
      int sensor2 = analogRead(A1);
      delay(1);
      Serial.print(sensor);
      Serial.print(',');
      Serial.println(sensor2);
    }
  }
}
*/
