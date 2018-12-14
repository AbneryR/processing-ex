public class Cazador extends Enemigo{
PVector vel;
PVector acc;
  
  
  Cazador(PVector loc){
  super(loc);
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  
  }
  
  void run(Jugador player){
  vel.add(acc);
  loc.add(vel);
  acc.mult(0);
  super.run(player);
  applyForce(player);
  
  
  }
  
  void applyForce(Jugador player){
  PVector fuerza = track(player).normalize();
  acc.add(fuerza.mult(.001));
  }
  
  void display(){
    noStroke();
    fill(125,80,80);
    ellipse(loc.x,loc.y, tam*2,tam*2);
   
  }
  
}