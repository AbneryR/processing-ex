import java.net.Socket;
  Cliente cte;

void setup(){
  size(800,600);
  background(255);
  cte = new Cliente();
}

void draw(){
  background(255);
  cte.conectar();
 
  cte.display();
//   cte.check();
}