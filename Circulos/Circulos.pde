
void setup() {
  size(750, 750);
  smooth(3);
  background(255);
}

void draw() {
  translate(width/2, height/2);
  stroke(random(255), random(255), random(255));    
  for (int a = 0; a<360; a++) {
    float x = random(50, 150);
    float xx = random(150, 360);
    pushMatrix();
    rotate(radians(a)); //Forma el círculo
    strokeCap(SQUARE); //Forma en que terminan las lineas. Puede ser SQUARE, PROJECT, or ROUND
    strokeWeight(3); //Ancho de la linea
    line(x, 0, 0, xx); //Realiza la linea
    popMatrix();
  }
}

void keyPressed() {
  if (key == 's') saveImage();
  if (key == 'e') exit();
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  println("Guardando imagen ... ");
  save(timestamp + ".png");
  println("Imagen guardada exitosamente");
}

void exit() {
  println("Saliendo");
  super.exit();
}
