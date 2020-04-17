float x1, y1, x2, y2; //variables for 2 sets of coordinates
float time = 0; //a "manual" clock
int n = 10; //number of iterations

void setup() {
  size(600, 500);
}

void draw() {
  background(0);
  
  pushMatrix(); //remember this whenever you use translate()
  translate(width/2, height/2); /*center coordinate system
  around the center of the app window*/

  for (int i = 0; i<n; i++) { //do the following n times
    float a = TWO_PI/n; /* calculate the angle needed
    to evenly arrange the points */
    
    /* in the following, we are using some math to create
    an x and y position of 2 points
    You can change this up all you want and get different
    results, but it's a good idea to get what each part does
    
    sin() or cos(): calculates a number between -1 and +1,
    based on whatever number is put inside the parentheses.
    You can multiply more sin() and cos() functions together
    to get more complex paths
    
    time: adds motion, as "time" is slight increased each frame
    
    *200 or *100: because sin() and cos() returns a small number,
    scaling it by some larger number will make the points move further
    away from the center of the coordinate system.
    
    i: the variable that makes every point slightly different from
    the previous, as "i" is increased in each loop
    
    try adding "-" (minus) to a sin() or cos()
    try changing 200 or 100 to another number
    try swapping a "sin" for "cos" or vice versa
    try adding or subtracting, multiplying or dividing by n or i
    
    */
    
    x1 = sin(time + i * a) * cos(time*i/n) * 200;
    y1 = cos(time + i * a) * 200;

    x2 = sin(time + i * a) * -sin(time*i/n) * 100;
    y2 = -cos(time + i * a) * 200;
    
    ellipse(x1, y1, 10, 10); //draw big ellipse at x1, y1
    ellipse(x2, y2, 5, 5); //draw small ellipse at x2, y2
    stroke(255-x1, 255-y1, 0); /* use the numbers from the coordinates
    to generate different colors for each lines for added flair */
    
    line(x1, y1, x2, y2); //make a line between the 2 points
  }
  popMatrix(); //remember this when you use pushMatrix()

  time += 0.01; //increase time by a small amount each frame
}
