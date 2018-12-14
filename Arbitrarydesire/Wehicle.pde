class Wehicle{
  PVector loc;
  PVector vel;
  PVector  acc;
  float r;
  float maxspeed;
  float maxforce;

  
  Wehicle(PVector loc){
  this.loc = loc;
  vel = new PVector(3,-2);
  vel.mult(5);
  acc = new PVector(0,0);
  r = 4;
  maxspeed = 4;
  maxforce = 0.2;
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
   // PVector f = PVector.div(force, r);
    acc.add(force);
  }
  
  void wander(){
   PVector desired = null;
    
    if(loc.x<50){
      desired = new PVector(maxspeed,vel.y);
    }
    
    else if(loc.x>width-50){
      desired = new PVector(-maxspeed,vel.y);
    }
    if(loc.y<50){
      desired = new PVector(vel.x, maxspeed);
    }
    else if(loc.y>height-50){
      desired = new PVector(vel.x, -maxspeed);
    }
    
    if(desired!= null){
     desired.normalize();
     desired.mult(maxspeed);
     PVector steer = PVector.sub(desired,vel);
     steer.limit(maxforce);
     applyForce(steer);
    }
    
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
  

}