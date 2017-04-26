import processing.net.*;
Server server;
int xPos, yPos;
color c;

void setup() {
  size(640, 360);
  server=new Server(this, 5204);
  noStroke();
}

void draw() {
  Client client = server.available();
  if (client != null) {
    String s = client.readStringUntil('\n');
    if (s!=null) {
      server.write(s);
      int values[]=int(splitTokens(s, ",\n"));
      c=values[0];
      xPos=values[1];
      yPos=values[2];
    }
  }
  fill(c, 100);
  if (xPos!=0 && yPos!=0)
    ellipse(xPos, yPos, 10, 10);
}

void serverEvent(Server server, Client client) {
  println("New client connected at "+client.ip());
}