float rot = 45; //the variabel that stores the rotation amount

void setup() {
  size(400, 400, P3D); //add the P3D value to get 3D functionality!
  rectMode(CENTER); /*rectangles will be drawn from 
  the middle out, and not from the corner down as default*/ 
  
  noFill(); //remove fill color from all shapes
  stroke(255); //draw outline in white on all shapes
}

void draw() {
  background(60, 0, 100); //purple background

  /*the "for loop" below tells the computer to make a temporary
  number, named "i", and repeat the loop as long as i is less than 25 (i<25).
  Every time it has repeated a loop, it adds 1 to whatever "i" is (i++). 
  Thus, it will repeat until becomes 25, and the loop will break 
  and the computer continues on to the next command.
  When we use "i" inside the loop, we are able to change the pattern,
  because "i" will be a different value each time the loop runs.
  */
  
  for (int i = 0; i < 25; i++) {
    /*the important thing to notice is that in the following, were not moving
    and rotate the shape, but the entire coordinate system that the shapes are
    drawn inside. It's weird, but necessary to control the rotation. */
    pushMatrix(); //"hey computer, we're about to do some translation/rotation stuff
    translate(width/2, height/2); //move the c-system into the center of the screen
    rotateZ(  radians(rot*i)  ); /* rotate everything using the rot value as an angle
    it's important to notice that we use the radians() function to convert regular
    degrees into radian degrees, which is what rotate() wants */
    rect(0, 0, 10*i, 10*i); //draw the shape, using "i" to scale it
    popMatrix(); //reset the c-system (for every pushMatrix, remember to add popMatrix)
  }

  rot = rot + 0.02; //add 0.02 to rot, so that it will a larger number next frame
}

void keyPressed() {
  if (key == 'p') {
    save("pattern" + rot + ".jpg"); //save the frame as a .jpg, with a unique number (rot)
  }
}
