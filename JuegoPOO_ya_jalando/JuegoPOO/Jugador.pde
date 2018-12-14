public class Jugador {
  PVector loc; //location -> posición
  PVector vel; // vel -> velocidad
  PVector acc;// acc -> acceleration ->aceleración
  int tam; //tam ->tamaño
  float vida; //vida, duh
  int puntos; //puntaje del jugador

  Jugador(PVector loc) { //recibe un Vector de posición
    this.loc = loc; //la posición del jugador es igual a la recibida
    vel = new PVector(0, 0); //velocidad = 0
    acc = new PVector(0, 0); //aceleración = 0
    vida = 100; // vida = 10
    puntos = 0; // puntos = 0
    tam = 10; //tamaño de 10 pixeles
  }
  //agrupa display, chequeo de bordes de pantalla y update
  void run() {
    update();
    wrapedges();
    display();
  }

  //Aplica una fuerza y cambia la aceleracion 
  void applyforce(PVector fuerza) {
    acc.add(fuerza);
  }

  //sin es golpeado, reduce la vida
  void golpeado() {
    vida-=30;
    met.perdio = true;
  }
  //Si la vida es menor a 0, regresar false
  Boolean sinvida() {
    if (vida<=0)
      return true;
    else
      return false;
  }

  void update() { //Nuestra funcion update aplica la fuerza a la velocidad para provocar el cambio en la posición, en la forma de integracion de Euler
    vel.add(acc);  //a velocidad le sumamos aceleracion, un cambio pequeño en la aceleración es un enorme cambio en la velocidad 
    loc.add(vel); //a la posición le sumamos la velocidad
    vel.limit(3); //limitamos la velocidad a 3
    acc.mult(0); //multiplicamos la aceleración por 0, si la dejamos como está, la aceleración se acumulará por cada ciclo
  }


  void wrapedges() { // no es wraping, no le cambié el nombre pero solo es la colisión con la ventana, vaya
    if (loc.x<0) { //si la posicion loc.x de este objeto es menor a 0
      loc.x = 0;  //su posición cambia a 0
      vel.x*=-1; // el valor x de su velocidad se invierte para que cambie de dirección con respecto al eje X,
    }
    if (loc.x>width) {
      loc.x = width; 
      vel.x*=-1;
    }
    if (loc.y<0) {
      loc.y = 0; 
      vel.y*=-1;
    }
    if (loc.y>height) {
      loc.y = height; 
      vel.y*=-1;
    }
  }

  void display() {
    strokeWeight(2);
    stroke(100,50,100);  //noStroke(), no linea externa o borde. strokeWeight(), ancho del borde, stroke(R,G,B,T), stroke (R,G,B), stroke(W,T),stroke(W)
    fill(200, 100, 200); //Fill es el relleno, aqui le hacemos un cambio divertido, el valor de transparencia está ligado a la vida, si la vida llega a 0, es como si desapareciera
    ellipse(loc.x, loc.y, tam*2, tam*2); //Ellipse, posicion x, posicion y, ancho de x, ancho de y
     text("VelX = "+ vel.x, 10, 10);
     text("VelY = "+ vel.y, 10, 20);
}

  public void setTam(int size) { //Set para cambiar el tamaño
    tam = size;
  }
}