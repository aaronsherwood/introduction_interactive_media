// higher number is slower
int speed = 5;

// change spread to make the bell curve wiser or narrower
int spread = 75;

// set the postion to start above the screen so the first circle is dark
int bellCurveCenter = -spread;

int ledPos[3] = {160, 320, 480};
int ledIndex[3] = {9, 10, 11};

void setup()
{
  for (int i=0; i<3; i++){
    pinMode(ledIndex[i], OUTPUT);
  }
}

void loop()
{
  for (int i=0; i< 3; i++) {
    // this is the juicy part
    // i'm taking the position of the circle and finding the distance of each LED from the center of our bell curve
    float distance = abs(ledPos[i]-bellCurveCenter);
    // this is the formula for the bell curve, multiply by 255 to put in the proper range for brightness
    float brightness = exp(-0.5*pow(distance/spread, 2.))*255;
    analogWrite(ledIndex[i],brightness);

  }
  
  // move the center
  // you could adjust the speed with your potentiometer
  if (millis()%speed==0)
    bellCurveCenter += 1;

  // start it over when it reaches the end
  // reset based on the spread so that it fades all the way out before resetting
  if (bellCurveCenter>640+spread) {
    bellCurveCenter = -spread;
  }
}
