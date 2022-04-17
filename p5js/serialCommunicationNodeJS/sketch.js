let xPos = 0;
let yPos = 0;
let onOff = "0";

function setup() {
  createCanvas(640, 480);
  noStroke();

  // Serial call and response through a websocket
  socket.on('message', function(msg) {
      if (msg != null) {
        var list = split(trim(msg), ",");
        print(list);
        if (list.length == 2) {
          xPos = map(list[0], 0, 1023, 0, width); // element 0 is the locH
          yPos = map(list[1], 550, 250, 0, height); // element 1 is the locV
        }
      }
      socket.emit('message', onOff);
    });
}

function draw() {
  background(200);
  ellipse(xPos, yPos, 50, 50); // draw the circle
  if (mouseIsPressed) {
    if (mouseX <= width / 2)
      onOff = "1";
    else
      onOff = "2";
  } else {
    onOff = "0";
  }
}
