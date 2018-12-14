class Wehicle{
  PVector loc;
  PVector vel;
  PVector  acc;
  float r;
  float maxspeed;
  float maxforce;
  float wandertheta;
  
  Wehicle(PVector loc){
  this.loc = loc;
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  r = 4;
  maxspeed = 4;
  maxforce = 0.1;
  }
  
  void run(){
  update();
  display();
  }
  
  
  void update(){
  vel.add(acc);
  vel.limit(maxspeed);
  loc.add(vel);
  acc.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, 4);
    acc.add(f);
  }
  
  void wander(){
    float wanderR = 25; // se calcula el radio para nuestro circulo de merodeo
    float wanderD = 80; // distancia para nuestro circulo de merodeo
    float change = 0.3;
    wandertheta += random(-change, change); //cambiar al azar wnadertheta
    
    //Ahora se calcula la nueva posicion de hiro hacia el circulo
    PVector circlepos = vel.get(); //Inicia con la velocidad
    circlepos.normalize(); // normalizar para obtener direccion
    circlepos.mult(wanderD); //Multiplicar por la distancia
    circlepos.add(loc); //Hacerlo relativo a la posicion del movil
    
    float h = vel.heading(); // necesitamos saber la direccion para compensar wandertheta
    
    PVector circleOffset = new PVector(wanderR*cos(wandertheta+h),wanderR*sin(wandertheta+h));
    PVector target = PVector.add(circlepos,circleOffset);
    seek(target);
    
    if(debug) drawWanderStuff(loc,circlepos,target,wanderR);
    
  }
  
  void seek(PVector target){
    PVector desired = PVector.sub(target,loc);
    desired.normalize();
    desired.mult(maxspeed);
    
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  
  void display(){
    float theta = vel.heading()+ PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape();
    vertex(0,-r*2);
    vertex(-r,r*2);
    vertex(r,r*2);
    endShape(CLOSE);
    popMatrix();
    
  }
   
    void drawWanderStuff(PVector loc, PVector circle, PVector target, float rad){
    stroke(0);
    noFill();
    ellipseMode(CENTER);
    ellipse(circle.x,circle.y,rad*2,rad*2);
    line(loc.x,loc.y,circle.x,circle.y);
    line(circle.x,circle.y, target.x,target.y);
    
    }

}