float n = 6;
float d = 9;

void setup() {
  size(400, 400);
}

void draw() {
  float k = n / d;
  background(255);
  translate(width / 2, height / 2);
  beginShape();
  stroke(0);
  for (float a = 0; a < TWO_PI * d; a += 0.02) {
    float r = 200 * cos(k * a);
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);
  }
  endShape(CLOSE);
}

void keyPressed() {
  if (key == 's') saveImage();
  if (key == 'e') exit();
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  save(timestamp + ".png");
}

void exit() {
  println("Exiting");
  super.exit();
}
