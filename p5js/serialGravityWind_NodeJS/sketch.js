let velocity;
let gravity;
let position;
let acceleration;
let wind;
let drag = 0.99;
let mass = 50;
let onOff = "0";

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  noFill();
  position = createVector(width/2, 0);
  velocity = createVector(0,0);
  acceleration = createVector(0,0);
  gravity = createVector(0, 0.5*mass);
  wind = createVector(0,0);

  // Serial call and response through a websocket
  socket.on('message', function(msg) {
      if (msg != null) {
        var list = split(trim(msg), ",");
        print(list);
        if (list.length == 1) {
          wind.x = map(list[0], 0, 1023, -2., 2.);
        }
      }
      socket.emit('message', onOff);
    });
}

function draw() {
  background(255);
  applyForce(wind);
  applyForce(gravity);
  velocity.add(acceleration);
  velocity.mult(drag);
  position.add(velocity);
  acceleration.mult(0);
  ellipse(position.x,position.y,mass,mass);
  if (position.y > height-mass/2) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      position.y = height-mass/2;
  }

  if (round(velocity.y)<0)
    onOff="1";
  else
    onOff="0";
}

function applyForce(force){
  // Newton's 2nd law: F = M * A
  // or A = F / M
  let f = p5.Vector.div(force, mass);
  acceleration.add(f);
}

function keyPressed(){
  if (key==' '){
    mass=random(15,80);
    position.y=-mass;
    velocity.mult(0);
  }
}
