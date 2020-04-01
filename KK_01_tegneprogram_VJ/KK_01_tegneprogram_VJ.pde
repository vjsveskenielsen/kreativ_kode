/*
Dette er et eksempel på hvordan man tilføjer Syphon eller Spout
outputs til sin Processing sketch, så man kan "sende" billedet ind
i fx MadMapper eller VDMX.
Mac-brugere skal hente Syphon, Windows-brugere skal hente Spout.
Man kan ikke bruge begge! Det er totalt afhængigt af om man bruger Mac eller PC.

For at hente:
Menu – Sketch – Import Library – Add Libraries – et vindue åbner
Søg på "Syphon" eller "Spout" – Klik installer – luk vindue igen

Herefter skal man tilføje de rigtige linjer kode til sin sketch.
Herunder er Tegneprogrammet fra Kreativ Kode, hvor jeg har tilføjet
de linjer kode der får Syphon outputtet til at virke.
Hvis man er på Windows skal man slette SYPHON linjerne, og fjerne de to
forreste "//" fra SPOUT linjerne.

*/

import codeanticode.syphon.*; //SYPHON #1 ud af 5 linjer
//import spout.*; //SPOUT #1 ud af 5 linjer

SyphonServer server; //SYPHON #2 ud af 5 linjer
//Spout spout; //SPOUT #2 ud af 5 linjer

// VARIABLES
int streg = 10; //the variable used for size of the line
color groen = color(0, 255, 0); //the color of the line
color roed = color(255, 0, 0); //the color of the background

//THIS LOOP RUNS ONCE
void setup() {
  size(400, 400, P3D); //set the size of the app to 400 pixels wide and 400 pixels tall
  background(roed); //set the background color to red, using the variable roed
  stroke(groen); //set the initial color of the stroke to green
  
  PJOGL.profile = 1; //SYPHON #3 ud af 5 linjer
  server = new SyphonServer(this, "Tegneprogram"); //SYPHON #4 ud af 5 linjer
  // spout = new Spout(this); //SPOUT #3 ud af 5 linjer
  // spout.createSender("Tegneprogram"); //SPOUT #4 ud af 5 linjer
}

//THIS LOOP REPEATS
void draw() {
  if (mousePressed == true) { //if the mouse is currently pressed...
    strokeWeight(streg); //set the stroke to whatever number streg is
    line(mouseX, mouseY, pmouseX, pmouseY); /*and draw a line
    from where the mouse is now, to where it was the last time draw() ran
    */
  }
  
  server.sendScreen(); //SYPHON #5 ud af 5 linjer
  //spout.sendTexture(); //SPOUT #5 ud af 5 linjer
}

//THIS LOOP RUNS ONLY WHEN A KEY IS BEING PRESSED
void keyPressed() {
  if (key == 'd') { //check if the key is the d key, if it is...
    background(roed); //... then do this
  }
  //add different functionality to different keys
  if (key == 'e') {
    stroke(roed);
  }
  if (key == 'g') {
    stroke(groen);
  }
  if (key == '1') {
    streg = 10;
  }
  if (key == '2') {
    streg = 20;
  }
}
