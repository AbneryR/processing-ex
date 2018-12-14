import java.util.Iterator;

class Particle{
  PVector acc;
  PVector vel;
  PVector loc;
  float lifespan;
  float mass;
  float theta;
  
    Particle(PVector l){
      acc = new PVector(0,0);
      vel = new PVector(random(-1,1), random(2,0));
      loc = l.get();
      lifespan =255;
      mass=random(20);
      theta = PI/4;
    }
    
    void run(){
      update();
      display();
    }
    
    void update(){
      vel.add(acc);
      loc.add(vel);
      acc.mult(0);
      lifespan-=2;
      theta = atan2(vel.x,vel.y);
    }
    
    void applyForce(PVector force){
      PVector f= PVector.div(force, mass);
      acc.add(f);
    }
    
    void display(){
      fill(0,lifespan);
      stroke(0,lifespan);
      pushMatrix();
      translate(loc.x,loc.y);
      rotate(theta);
      ellipse(0,0,mass,mass);
      popMatrix();
    }
    
    boolean isDead(){
    if(lifespan < 0.0)return true; return false;
    }

}