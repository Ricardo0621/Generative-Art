int seed = int(random(999999)); //Se define la semilla como un número random //<>//

void setup() {
  size(800, 800);
  smooth(8);
  generate(); //Funcion que genera una nueva semilla
  background(0);
}

void draw() {
  float time = millis()/1000.;
  randomSeed(seed); //Semilla para el elemento random lo que hace que los puntos se desplazen. COn 1 los puntos son gigantes
  //randomSeed(1200);
  int cc = int(random(120)); //Cantidad de puntos de pintura
  //int cc = 120;
  int div = int(random(4, 90));
  //int div = 24; //Afecta el tamaño de los puntos, entre mas pequeño el valor más grandes los puntos
  float ss = width*1./div; //Divide el ancho de la pantalla entre div
  stroke(0, 70); //Dibuja bordes en cada circulo. Hace el efecto de generar cada circulo a la vez. El primero argumento es el color el RGB, el segundo es la opacidad, a mayor opacidad más bordeado el circulo
  //noStroke(); //Desabilita dibujar bordes
  for (int i = 0; i < cc; i++) {
    float x = int(random(div+1))*ss;
    float y = int(random(div+1))*ss;
    float desplazamiento = time*random(0.1, 1)*60*(int(random(2))*2-1); //Puede ser negativo
    println(i);
    if (random(1) > 0.5) {
      x += desplazamiento;
      if (x < -ss) {
        x = width*ss*2-(abs(x)%(width+ss));
        println("Menor que -ss");
      }
      if (x > width+ss) 
      {
        x = (x%(width+ss))-ss;
        println("Mayor que width");
      }
    } else {
      //y += desplazamiento;
      if (y < -ss) y = height*ss*2-(abs(y)%(height+ss));
      if (y > height+ss) y = (y%(height+ss))-ss;
    }
    float s = ss*random(1)*(1-cos(time*random(1))*random(1)); //Efecto ola
    float c = random(colors.length)+ time*abs(random(-1, 1));
    fill(getColor(c), 15); //Llena el circulo de un color y una opacidad
    ellipse(x, y, s, s); //Hace una elipse de alto-ancho s
  }
}

void keyPressed() {
  if (key == 's') saveImage();
  else generate();
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  saveFrame(timestamp+".png");
}

void generate() {
  seed = int(random(999999));
  background(0);
}

int colors[] = {#ff2337, #2c56ff, #0cc8ff, #af46ff, #ff8eff, #ff00ff, #ff7d4e, #ff4400, #ff4d4d, #ff0000};

int getColor(float v) {
  v = v%(colors.length);
  int c1 = colors[int(v%colors.length)];
  int c2 = colors[int((v+1)%colors.length)];
  //Calcula un color entre dos colores con un incremento específico. 
  //El último parámetro es la cantidad a interpolar entre los dos primeros colores
  return lerpColor(c1, c2, v%1);
}
