class Jugador {
  PVector loc;
  PVector vel;
  PVector acc;
  float vida;
  float puntos;
  
  Jugador(PVector location){
    loc = location;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    vida = 100;
    puntos = 0;
  }
  
  void run(){
  update();
  display();
  }
  
  void update(){
    vel.add(acc);
    vel.limit(2);
    loc.add(vel);
    acc.mult(0);
    wrapedges(); 

  }
  
  void applyforce(PVector force){
    acc = force;
  }
  
  boolean SinVida(){
      if(vida<0) return true; return false;
  }
  
  void golpeado(){
    vida-=.01;
  }
  
  void display(){
    fill(150);
    ellipse(loc.x,loc.y, 15, 15);
  
  }
  
   void wrapedges(){
  if(loc.x <0)loc.x=0; vel.x*=-1;
  if(loc.x >width) loc.x=width; vel.x*=-1;
  if(loc.y < 0) loc.y=0; vel.y*=-1;
  if(loc.y> height) loc.y= height; vel.y*=-1;

  /*
   if(loc.x <0-20 ) loc.x=width+10;
   if(loc.x >width+20 ) loc.x=0-10;
   if(loc.y <0-20 ) loc.y=height+10;
   if(loc.y >height+20 ) loc.y=0-10;
  */
  }
  
}