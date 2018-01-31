import processing.net.*;
Server server;

void setup() {
  size(640, 360);
  server=new Server(this, 5204);
}

void draw() {
  if (mouseX!=0 && mouseY!=0 && pmouseX!=0 && pmouseY!=0) {
    ellipse(mouseX, mouseY, 5, 5);
    line(pmouseX, pmouseY, mouseX, mouseY);
    String out=mouseX+","+mouseY+"\n";
    server.write(out);
  }
}

void serverEvent(Server server, Client client) {
  println("New client connected at "+client.ip());
}