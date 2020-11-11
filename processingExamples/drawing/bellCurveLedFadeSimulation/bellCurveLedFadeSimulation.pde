int speed = 4;

// change spread to make the bell curve wiser or narrower
int spread = 200;

// set the postion to start above the screen so the first circle is dark
int bellCurveCenter = -spread;

int[] ledPos;

void setup() {
  size(640, 640);

  ledPos = new int[3];
  // three different heights to put three different circle on screen
  ledPos[0] = height/4;
  ledPos[1] = height/2;
  ledPos[2] = height - height/4;
}

void draw() {
  background(255);

  //these ellipses correspond to your three LEDs

  for (int i=0; i< ledPos.length; i++) {
    // this is the juicy part
    // i'm taking the position of the circle and finding the distance of each LED from the center of our bell curve
    float distance = abs(ledPos[i]-bellCurveCenter);
    // this is the formula for the bell curve, multiply by 255 to put in the proper range for brightness
    float brightness = exp(-0.5*pow(distance/spread, 2.))*255;
    fill(brightness);
    // instead of ellipse you'll analogWrite your LED here, of course
    ellipse(width/2, ledPos[i], 60, 60);
  }

  // just to show where the current center is
  // you don't need this in Arduino of course
  line(0, bellCurveCenter, width, bellCurveCenter);

  // move the center
  // you could adjust the speed with your potentiometer
  bellCurveCenter += speed;

  // start it over when it reaches the end
  // reset based on the spread so that it fades all the way out before resetting
  if (bellCurveCenter>height+spread) {
    bellCurveCenter = -spread;
  }
}
