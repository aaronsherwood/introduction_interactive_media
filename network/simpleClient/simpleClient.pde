import processing.net.*;
Client client;
String typing;

void setup(){
 client= new Client(this,"127.0.0.1",5204); 
 typing="";
}

void draw(){
  if (client.available()>0){
     println(client.readString()); 
  }
}

void keyPressed(){
   if(key=='\n') {
     client.write(typing); 
     typing="";
   } else {
    typing+=key; 
   }
   
}