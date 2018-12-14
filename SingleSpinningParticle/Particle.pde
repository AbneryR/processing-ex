class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  float mass;
  float angle;
  float aVel;
  float aAcc;
  
  
  Particle(PVector l){
  loc = l.get();
  acc = new PVector(0,0);
  vel = new PVector(0,0);
  lifespan = 255;
  mass=10;  
  angle = 90;
}
  void run(){
    update();
    display();
    edges();
  }
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    lifespan -=1.0;
  }
  
  void display(){
    stroke(0,lifespan);
    fill(-lifespan,lifespan);
    angle=atan2(vel.x,vel.y);
    pushMatrix();
    rectMode(CENTER);
    translate(loc.x,loc.y);
    rotate(angle);
    rect(0,0,10,10);
    popMatrix();
    
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acc.add(f);
    
  }
 
  
  void edges(){
    if(loc.x<0){loc.x=0; vel.x*=-1;}
    if(loc.x>width){loc.x=width; vel.x*=-1;}
    if(loc.y<0){loc.y=0; vel.y*=-1;}
    if(loc.y>height){loc.y=height; vel.y*=-1;}
  }
  
  boolean isDead(){
    if(lifespan <0.0)return true;return false;
  }
  
}