// higher number is slower
int speed = 20;

// change spread to make the bell curve wiser or narrower
float spread = .2;

// set the postion to start above the screen so the first circle is dark
float bellCurveCenter = -spread;

float ledPos[3] = {.25, .5, .75};
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
    // i'm taking the position and finding the distance of each LED from the center of our bell curve
    float distance = abs(ledPos[i]-bellCurveCenter);
    // this is the formula for the bell curve, multiply by 255 to put in the proper range for brightness
    float brightness = exp(-0.5*pow(distance/spread, 2.))*255;
    analogWrite(ledIndex[i],brightness);

  }
  
  // move the center
  // you could adjust the speed with your potentiometer
  if (millis()%speed==0)
    bellCurveCenter += .01;

  // start it over when it reaches the end
  // reset based on the spread so that it fades all the way out before resetting
  if (bellCurveCenter>1.+spread*2) {
    bellCurveCenter = -spread*2;
  }
}
