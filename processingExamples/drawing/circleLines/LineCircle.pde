class LineCircle {
  int radius;
  int x;
  int y;
  float x1, y1, x2, y2, c1, c2, c3, c4;
  int amount;
  long seedAmount;

  LineCircle(int _x, int _y, int _a, int _r ) {
    x = _x;
    y = _y;
    amount = _a;
    radius = _r;
    seedAmount = millis();
    
  }

  void draw() {
    randomSeed(seedAmount);
    pushMatrix();
    translate(x, y);
   
    for (int i=0; i<amount; i++) {
      float angle1 = random(TWO_PI);//+(noise(i*frameCount*.000001)-.5)*(1-smoothedMouseY/height);
      float angle2 = random(TWO_PI);//+(-noise(i*frameCount*.00001)+.5)*(1-smoothedMouseY/height);
      float x1 = cos(angle1) * radius;
      float y1 = sin(angle1) * radius;
      float x2 = cos(angle2) * radius;
      float y2 = sin(angle2) * radius;
      
      //line(x1, y1, x2, y2);
      alterBezier(x1, y1, x2, y2, i);
      bezier(x1, y1, c1, c2, c3, c4, x2, y2);
    }
    popMatrix();
  }

  void checkInside(int _x, int _y) {
    if (dist(x, y, _x, _y)<radius) {
      seedAmount=millis();
    }
  }
  
  void alterBezier(float x1, float y1, float x2, float y2, int i){
      c1=lerp(x1,x1*noise(frameCount*.0001*x1)*2,smoothedMouseX/width)*(1-smoothedMouseY/height);
      c2=lerp(y1,y1*noise(frameCount*.0001*y1)*2,smoothedMouseX/width)*(1-smoothedMouseY/height);
      c3=lerp(x2,x2*noise(i*.01*x2)*2,smoothedMouseX/width)*((1-smoothedMouseY/height) * 3-2);
      c4=lerp(y2,y2*noise(i*.01*y2)*2,smoothedMouseX/width)*((1-smoothedMouseY/height) * 3-2 );
  }
 
}