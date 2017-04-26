import processing.net.*;
Client client;
int xPos, yPos;
color c;

void setup() {
  size(640, 360);
  client= new Client(this, "127.0.0.1", 5204);
  noStroke();
  c=color(255,127,200);
}

void draw() {
  if (mousePressed) {
    String out=c+","+mouseX+","+mouseY+"\n";
    client.write(out);
  }
  fill(c, 100);
  if (xPos!=0 && yPos!=0)
    ellipse(xPos, yPos, 10, 10);
}

void clientEvent(Client client) {
  String coords=client.readStringUntil('\n');
  if (coords!=null) {
    int values[]=int(splitTokens(coords, ",\n"));
    c=values[0];
    xPos=values[1];
    yPos=values[2];
  }
}