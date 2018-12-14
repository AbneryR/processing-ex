class Wehicle{
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;
  
  
  Wehicle(PVector loc){
  this.loc = loc;
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  r = 3;
  maxspeed= 4; 
  maxforce = 0.01;
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
  
  void seek(PVector tar){
  PVector desired = PVector.sub(tar, loc);
  desired.normalize();
  desired.mult(maxspeed);
  PVector steer = PVector.sub(desired,vel);
  steer.mult(maxforce);
  applyForce(steer);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,r);
    acc.add(f);
  }
  
  void checkEnviroment(Ambiente amb){
    if(loc.x > amb.loc.x &&
      loc.y > amb.loc.y &&
      loc.x < amb.loc.x+amb.w &&
      loc.y < amb.loc.y+amb.h){
        maxspeed*= amb.maxspeed;
        maxforce*= amb.maxforce;
    }
    else{
      maxspeed= 4;
      maxforce= 0.01;
    }
  }
  
  void display(){
    float theta = vel.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape();
    vertex(0,-r*2);
    vertex(-r,r*2);
    vertex(r,r*2);
    endShape();
    popMatrix();
  
  }
  

}