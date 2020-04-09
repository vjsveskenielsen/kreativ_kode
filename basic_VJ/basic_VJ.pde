/* Dette er et eksempel på strukturen i en Processing VJ app med Syphon
eller Spout funktionalitet. Sørg for at rette efter platform. Den tager afsæt
i kode fra KK_01_tegneprogram_VJ og KK_02_pattern_VJ */

import codeanticode.syphon.*; //SYPHON #1 ud af 5 linjer
//import spout.*; //SPOUT #1 ud af 5 linjer

SyphonServer server; //SYPHON #2 ud af 5 linjer
//Spout spout; //SPOUT #2 ud af 5 linjer

PGraphics canvas;

float rot = 45; 

void setup() {
  size(960, 540, P3D); 

  PJOGL.profile = 1; //SYPHON #3 ud af 5 linjer
  server = new SyphonServer(this, "basic_VJ"); //SYPHON #4 ud af 5 linjer
  // spout = new Spout(this); //SPOUT #3 ud af 5 linjer
  // spout.createSender("basic_VJ"); //SPOUT #4 ud af 5 linjer

  canvas = createGraphics(1920, 1080, P3D); 
  canvas.beginDraw();

  canvas.rectMode(CENTER);
  canvas.noFill();
  canvas.stroke(255);

  canvas.endDraw();
}

void draw() {

  canvas.beginDraw();

  canvas.background(60, 0, 100);

  for (int i = 0; i < 25; i++) {

    canvas.pushMatrix(); 
    canvas.translate(canvas.width/2, canvas.height/2); 
    canvas.rotateZ(  radians(rot*i)  ); 
    canvas.rect(0, 0, 10*i, 10*i); 
    canvas.popMatrix();
  }

  canvas.endDraw(); 

  image(canvas, 0, 0, width, height);

  server.sendImage(canvas); //SYPHON #5 ud af 5 linjer
  //spout.sendTexture(canvas); //SPOUT #5 ud af 5 linjer

  rot = rot + 0.02;
}
