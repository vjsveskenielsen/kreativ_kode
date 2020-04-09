/*Dette er et eksempel på hvordan man kan lave grafik i høj opløsning uden at
skulle lave et kæmpe Processing vindue.
Eksemplet tager udgangspunkt i KK_02_pattern, og alle linjer kode der ikke har
en kommentar, er enten nye linjer kode eller linjer man skal rette fra den
oprindelige KK_02_pattern sketch. Metoden tager udgangspunkt i at lave
et eksternt "lag" og tegne grafikken på det, og så vise en mindre udgave af det lag
inde i Processing vinduet. Der er ikke nogen visuel ændring, men opløsningen
er meget højere.
*/

PGraphics canvas; //opret et nyt "lag" som der skal tegnes på, navngiv det "canvas"

float rot = 45; 

void setup() {
  size(960, 540, P3D); /*for at undgå at resultatet ser "strukket" ud inde i
  vores Processing sketch, sørger vi for at ændre størrelsen på vinduet så
  det er i samme "aspect ratio" som canvas. I dette tilfælde er det fint at 
  gøre billedet halvt så stort, altså 1920/2 = 960, 1080/2 = 540
  NB! man kan ikke lave udregninger i size(), så det er frem med lommeregneren */
  
  canvas = createGraphics(1920, 1080, P3D); /*indstil størrelsen på canvas 
  bemærk at der er samme parametre som man ville bruge i size(), men man kan
  sætte størrelsen på canvas uden at det ændrer på selve Processing vinduet*/
  
  canvas.beginDraw(); //denne linje skal kommer før man ændrer noget på canvas
  
  /* Nu skal man bare tilføje "canvas." før alle instruktionerne der har noget 
  at gøre med grafik, så man instiller canvas på samme måde som man før
  indstillede det almindelige Processing vindue.
  */

  canvas.rectMode(CENTER);
  canvas.noFill();
  canvas.stroke(255);
  
  canvas.endDraw(); //denne linje skal komme efter alle ændringer på canvas
  //
}

void draw() {
  /* ligesom i setup starter vi med beginDraw() og slutter med endDraw.
  Og så skal man igen tilføje "canvas." før alle instruktioner der har noget
  at gøre med at tegne */
  
  canvas.beginDraw(); //begynd at tegne på canvas
  
  canvas.background(60, 0, 100);

  for (int i = 0; i < 25; i++) {
   
    canvas.pushMatrix(); 
    canvas.translate(canvas.width/2, canvas.height/2); /* NB! Hvis man brugte
    "width" og "height" ville man bruge størrelsen på vinduet, og ikke størrelsen
    på canvas. Så husk at bruge "canvas." før alle instruktioner der har noget at
    gøre med width og height.*/
    canvas.rotateZ(  radians(rot*i)  ); 
    canvas.rect(0, 0, 10*i, 10*i); 
    canvas.popMatrix();
  }
  
  canvas.endDraw(); //stop med at tegne på canvas
  
  image(canvas, 0,0, width, height); /* vis canvas i vores Processing vindue,
  sæt øverste venstre hjørne af canvas i øverste venstre hjørne af vinduet (0,0)
  og sørg for at canvas fylder vinduet ud (width, height). */

  rot = rot + 0.02; 

void keyPressed() {
  if (key == 'p') {
    canvas.save("pattern" + rot + ".jpg"); /* istedet for at gemme et billede
     af hvad der er indenfor vinduet, gemmer vi et billede af canvas direkte. */
}
