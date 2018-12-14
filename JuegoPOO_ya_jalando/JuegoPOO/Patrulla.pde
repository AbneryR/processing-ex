public class Patrulla extends Enemigo{
  PVector vel;
  Boolean direccion;

  Patrulla(PVector loc){
    super(loc);
    vel= new PVector(random(-2,2),random(-2,2));
    direccion = true;
    vida = 20;
    tam= 20;
  }
  
  void run(Jugador player){
   mover();
   collision(player);
   wrapedges();
   display();
  }
  
  void mover(){
    loc.add(vel);
    vel.limit(5);
    if(second()%2==0){
      cambiarVel();   
    }
    if(second()%3==0){
      cambiarDir();
      }
    }
    
    
    void cambiarVel(){
      if(direccion==false)
     vel= new PVector(random(-5,5),0);
     else
      vel= new PVector(0, random(-5,5));
    }
    
    
    void cambiarDir(){
      direccion= !direccion;
      vel.mult(-1);
    }
   
    void wrapedges() {
    if (loc.x<0) {
      loc.x = 0; 
      vel.x*=-1;
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
    
    void display(){   
    noStroke();
    fill(60,170,100);
    ellipse(loc.x,loc.y, tam*2,tam*2);
    text(second(),10,10);
  }
    
    
  }