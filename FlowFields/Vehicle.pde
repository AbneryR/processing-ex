class Vehicle{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float maxspeed;
  float maxforce;
  
  Vehicle(){
   loc = new PVector(random(width), random(height));
   vel = new PVector(0,0);
   acc = new PVector(random(-1,1),random(-1,1));
   mass = 10;
   maxspeed = 2;
   maxforce = .3;
  }
  
  void run(){
  update();
  checkedges();
  display();
  }
  

  void update(){
    acc.limit(maxforce);
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(f, mass);
    acc.add(force);
  }
  
  void follow(Flowfield follow){
    PVector desired = follow.lookup(loc);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  /*
  void modeloDeReynoldsSeek(fuerza){
  PVector deseada = fuerza;
  deseade.mult(maximavelocidad);
  PVector giro = PVector.sub(deseada, este.velocidad);
  steer.limit(fuerzaMaxima);
  aplicarFuerza.(giro)
  }
  */
  void display(){
    float theta = vel.heading()+ HALF_PI;
    pushMatrix();
    fill(175);
    translate(this.loc.x, this.loc.y);
    rotate(theta);
    beginShape();
    vertex(0,-this.mass);
    vertex(-this.mass/2, this.mass);
    vertex(this.mass/2,this.mass);
    endShape(CLOSE);
    popMatrix();
  }
  
  void checkedges(){
    
    if (loc.x > width) loc.x = 0;
    else if (loc.x < 0) loc.x = width;
    if (loc.y > height) loc.y = 0;
    else if (loc.y <  0) loc.y = height;
  }
  
}