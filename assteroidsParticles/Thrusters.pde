class Thrusters{
PVector loc;
PVector acc;
PVector vel;
float lifespan;
float angle;

  Thrusters(Spaceship s){
  loc = s.loc.get();
  vel = s.vel.get();
  acc = s.acc.get();
  angle = s.angle;
  lifespan= 100;
  }
  
  void run(){
  display();
  update();
  }
  
  void update(){
  vel = s.vel.get();
  vel.mult(-1);
  loc.add(vel);
  lifespan-=2;
  }
  
  void display(){
  noStroke();
  fill(255-lifespan*random(1),102,0,lifespan);
  pushMatrix();
  rectMode(CENTER);
  translate(loc.x,loc.y);
  rect(0,10,3,3);
  popMatrix();
  }
  
  boolean isDead(){
  if(lifespan<0.0)return true; return false;
  }
  


}