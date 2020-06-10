
import codeanticode.syphon.*; //SYPHON #1 ud af 5 linjer
//import spout.*; //SPOUT #1 ud af 5 linjer

import themidibus.*; //importer MIDI bibliotek

SyphonServer server; //SYPHON #2 ud af 5 linjer
//Spout spout; //SPOUT #2 ud af 5 linjer

PGraphics canvas;

MidiBus myBus;

int whichGraphic = 0;

float rot = 0; 
float amount = 0;
float speed = 0;
int r = 255;
int g = 255;
int b = 255;

void setup() {
  size(960, 540, P3D); 

  PJOGL.profile = 1; //SYPHON #3 ud af 5 linjer
  server = new SyphonServer(this, "basic_VJ"); //SYPHON #4 ud af 5 linjer
  // spout = new Spout(this); //SPOUT #3 ud af 5 linjer
  // spout.createSender("basic_VJ"); //SPOUT #4 ud af 5 linjer

  //MidiBus.list();
  myBus = new MidiBus(this, 0, 1);
  canvas = createGraphics(1920, 1080, P3D); 
  canvas.beginDraw();

  canvas.rectMode(CENTER);
  canvas.noFill();
  canvas.stroke(r, g, b);

  canvas.endDraw();
}

void draw() {

  canvas.beginDraw();

  canvas.background(60, 0, 100);

  if (whichGraphic == 0) rotatingSquares();
  else if (whichGraphic == 1) rotatingRectangles();

  canvas.endDraw(); 

  image(canvas, 0, 0, width, height);

  server.sendImage(canvas); //SYPHON #5 ud af 5 linjer
  //spout.sendTexture(canvas); //SPOUT #5 ud af 5 linjer

  rot = rot + speed;
}

void rotatingSquares() {
  int _amount = round( map(amount, 0, 1, 0, 25) );
  for (int i = 0; i < _amount; i++) {
    canvas.pushMatrix(); 
    canvas.translate(canvas.width/2, canvas.height/2);
    canvas.rotateZ(  radians(rot*i)  ); 
    canvas.rect(0, 0, 10*i, 10*i); 
    canvas.popMatrix();
  }
}

void rotatingRectangles() {
  int _amount = round( map(amount, 0, 1, 0, 25) );
  for (int i = 0; i < _amount; i++) {
    canvas.pushMatrix(); 
    canvas.translate(canvas.width/2, canvas.height/2);
    canvas.rotateZ(  radians(rot*i)  ); 
    canvas.rect(0, 0, 20*i, 10*i); 
    canvas.popMatrix();
  }
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  if (channel == 10 && number == 16) amount = map(value, 0, 127, 0, 1);
  if (channel == 10 && number == 17) speed = map(value, 0, 127, 0, 1);
  if (channel == 10 && number == 32) whichGraphic = 0;
  if (channel == 10 && number == 33) whichGraphic = 1;
}
