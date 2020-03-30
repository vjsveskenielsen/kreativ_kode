// VARIABLES
int streg = 10; //the variable used for size of the line
color groen = color(0, 255, 40); //the color of the line
color roed = color(255, 0, 0); //the color of the background

//THIS LOOP RUNS ONCE
void setup() {
  size(400, 400); //set the size of the app to 400 pixels wide and 400 pixels tall
  background(roed); //set the background color to red, using the variable roed
  stroke(groen); //set the initial color of the stroke to green
}

//THIS LOOP REPEATS
void draw() {
  if (mousePressed == true) { //if the mouse is currently pressed...
    strokeWeight(streg); //set the stroke to whatever number streg is
    line(mouseX, mouseY, pmouseX, pmouseY); /*and draw a line
    from where the mouse is now, to where it was the last time draw() ran
    */
  }
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
