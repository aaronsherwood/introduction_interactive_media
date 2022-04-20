let port, reader, writer;
let serialActive = false;
let velocity;
let gravity;
let position;
let acceleration;
let wind;
let drag = 0.99;
let mass = 50;
let onOff = 0;

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  position = createVector(width / 2, 0);
  velocity = createVector(0, 0);
  acceleration = createVector(0, 0);
  gravity = createVector(0, 0.5 * mass);
  wind = createVector(0, 0);
  textSize(18);
  noStroke();
}

function draw() {
  background(0, 255, 255);
  fill(255, 0, 0, 200);
  if (!serialActive) {
    text("Press Space Bar to select Serial Port", 20, 30);
  } else {
    applyForce(wind);
    applyForce(gravity);
    velocity.add(acceleration);
    velocity.mult(drag);
    position.add(velocity);
    acceleration.mult(0);
    ellipse(position.x, position.y, mass, mass);
    if (position.y > height - mass / 2) {
      velocity.y *= -0.9; // A little dampening when hitting the bottom
      position.y = height - mass / 2;
    }

    if (ceil(velocity.y) < 0 && height - (position.y + mass / 2) < 50)
      onOff = 1;
    else
      onOff = 0;
  }
}

function applyForce(force) {
  // Newton's 2nd law: F = M * A
  // or A = F / M
  let f = p5.Vector.div(force, mass);
  acceleration.add(f);
}

function mousePressed() {
  mass = random(15, 80);
  position.y = -mass;
  velocity.mult(0);
}

function keyPressed() {
  if (key == ' ' && !serialActive) {
    setUpSerial();
  }
}

async function setUpSerial() {
  noLoop();
  ({
    port,
    reader,
    writer
  } = await getPort());
  serialActive = true;
  runSerial();
  loop();
}

async function runSerial() {
  try {
    while (true) {
      const {
        value,
        done
      } = await reader.read();
      if (done) {
        // Allow the serial port to be closed later.
        reader.releaseLock();
        break;
      }

      ////////////////////////////////////
      //READ FROM ARDUINO HERE
      ////////////////////////////////////
      if (value != null) {
        // make sure there is actually a message
        // split the message
        let fromArduino = split(trim(value), ",");
        // if the right length, then proceed
        if (fromArduino.length == 1) {
          // only store values here
          // do everything with those values in the main draw loop
          wind.x = map(fromArduino[0], 0, 1023, -2., 2.);
        }

        //////////////////////////////////
        //SEND TO ARDUINO HERE (handshake)
        //////////////////////////////////
        let sendToArduino = onOff + "\n";
        await writer.write(sendToArduino);
      }
      ////////////////////////////////////
    }
  } catch (e) {
    console.error(e);
  }
}

//Arudino Code
/*
void setup() {
  Serial.begin(9600);
  Serial.println("0");
  pinMode(2, OUTPUT);
}

void loop() {
  while (Serial.available()) {
    byte bounce = Serial.parseInt();
    if (Serial.read() == '\n') {
      digitalWrite(2, bounce);
      int sensor = analogRead(A0);
      Serial.println(sensor);
    }
  }
}
*/
