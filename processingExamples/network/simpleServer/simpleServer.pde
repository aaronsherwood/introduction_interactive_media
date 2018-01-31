import processing.net.*;
Server server;

void setup() {
  server=new Server(this, 5204);
}

void draw() {
  Client client=server.available();
  if (client!=null) {
    String s=client.readString();
    println(s);
    server.write("You said "+s);
  }
}

void serverEvent(Server server, Client client){
 println("New client connected at "+client.ip()); 
}