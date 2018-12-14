public class Efecto extends Particle{
//FALTA LOC
PVector vel;
PVector acc;
float angle;
float lifespan;

  Efecto(){
  vel = new PVector(0,0);
  acc = new PVector(random(-1,1),random(-1,1));
  lifespan = 255;
  angle= PI/4;
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
  angle = atan2(vel.x, vel.y);
  
  }
  
  void display(){
  noStroke();
  fill(255, 105,0,255);
  pushMatrix();
  rectMode(CENTER);
  translate(loc.x,loc.y);
  rotate(angle);
  rect(0,0,10,10);
  popMatrix();  
  
  }
  
  boolean isDead(){
  if(lifespan<0.0)return true;return false;
  }

  
}