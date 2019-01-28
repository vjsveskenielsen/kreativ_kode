color hvid = color(255, 255, 255);
color bg = color(255, 0, 200);
boolean isEraser = false;

void settings() {
  size(400, 400);
}
void setup() {
  background(bg);
  strokeWeight(10);
  stroke(hvid);
}

void draw() {
  // hvis musen trykkes ned, så tegn en streg fra den nuværende til den tidligere museposition
  if (mousePressed == true) line(mouseX, mouseY, pmouseX, pmouseY);
   
  /*
  bemærk at man gerne må skrive et if statement i een linje,
  uden tuborgklamper, hvis man kun "gør" een ting
  */
}

void keyPressed() {
  // SLET ALLE STREGER
  if (key == 'd') background(bg); //hvis vi trykker d-tasten, så mal alting over med en ny baggrund
  
  // SKIFT MELLEM VISKELÆDER OG STREG
  if (key == 'v') { //hvis du har trykket på v-tasten...
    //... så tjek om vi visker eller ikke visker...
    if (isEraser == false) { // hvis indstillingen er sat til at viske ud...
      stroke(hvid); //... sæt stregfarven til hvid ...
      isEraser = true; //... gem den nye indstilling
    } else { // hvis indstillingen er sat til at tegne streger...
      stroke(bg); //... sæt stregfarven til at være ligesom baggrunden
      isEraser = false; //... og gem den nye indstilling
    }
  }
}
