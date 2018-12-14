class Particle{
PVector loc;
PVector vel;
PVector acc;
float lifespan;
float theta;

  Particle(PVector l){
    loc = l;
    vel = new PVector(0,0);
    acc = new PVector(random(-1,1),random(-1,1));
    lifespan = 255;
  }
  
  void run(){
   update();
   display();
  }
  
  void update(){
     vel.add(acc);
     loc.add(vel);
     acc.mult(0);
     lifespan -=2;
     theta= atan2(vel.x,vel.y);
  }
  
  void display(){
    noStroke();
    fill(0,lifespan);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    ellipse(0,0,10,10);
    popMatrix();
  }
 
  
  void applyForce(PVector force){
  PVector f=force.get();
  acc.add(f);
  }
  
  boolean isDead(){
  if(lifespan<0.0)return true;return false;  
  }
  
    

}