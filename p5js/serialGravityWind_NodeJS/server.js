var osc = require('node-osc');
var io = require('socket.io')(8081);
var connect = require('connect');
var serveStatic = require('serve-static');
const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline')
var isConnected = false;
var globalSocket;

///////////////\\\\\\\\\\\\\\\
// CHANGE SERIAL PORT HERE \\
var path = '/dev/tty.usbmodem14201'
///////////////\\\\\\\\\\\\\\\

const port = new SerialPort(path, {
  baudRate: 9600
})

const parser = new Readline({
  delimiter: '\r\n'
})

port.pipe(parser)

parser.on('data', line => {
  try {
    if (isConnected) {
      console.log("received from arduino: "+line)
      globalSocket.emit("message", line);
    }
  } catch (err) {
    console.log(err);
  }
});

var isConnected = false;

io.sockets.on('connection', function(socket) {
  console.log('connection');
  globalSocket = socket;
  socket.on("config", function(obj) {
    isConnected = true;
    socket.emit("message", "connected");
  });
  socket.on("message", function(msg) {
    console.log("received message from p5: "+msg);
    port.write(msg)
  });
  socket.on('disconnect', function() {
    if (isConnected) {
      isConnected = false;
    }
  });
});

connect().use(serveStatic(__dirname)).listen(8000, function() {
  console.log('Server running on 8000...');
});
