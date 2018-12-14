class Particle{
PVector loc;
PVector vel;
PVector acc;
float angle;
float mass;
float lifespan;

  Particle(PVector loc_){
  loc = loc_.get();
  vel = new PVector(0,0);
  acc = new PVector(random(-1,1),random(-1,1));
  angle = PI/4;
  mass = 1;
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
  angle=atan2(vel.x,vel.y);
  lifespan-=2;
  }
  
  void display(){
  noStroke();
  fill(255-lifespan*.1,102,0,lifespan);
  pushMatrix();
  rectMode(CENTER);
  translate(loc.x,loc.y);
  rotate(angle);
  rect(0,0,10,10);
  popMatrix();
  }
  
  void applyForce(PVector force){
  PVector f= PVector.div(force,mass);
  acc.add(f);
  }
  
  boolean isDead(){
  if(lifespan<0.0)return true;return false;
  }

}