class Vehicle{
PVector loc;
PVector vel;
PVector acc;
float maxspeed;
float maxforce;
float r;


  Vehicle(float x, float y){
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    maxspeed = 3;
    maxforce = .1;
    r = 5;
  }
  

  void update(){
  vel.add(acc);
  vel.limit(maxspeed);
  loc.add(vel);
  acc.mult(0);
  }
  
  void display(){
    float theta = vel.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
  void applyForce(PVector p){
    acc.add(p); 
  }
  
  void seek(float x, float y){
    PVector desired = PVector.sub(new PVector(x,y), loc);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  
  void separate(ArrayList<Vehicle> vlist){
    
    float desiredseparation = 50;
    PVector sum = new PVector();
    int count = 0;
    
    for(Vehicle other : vlist){
      float d = PVector.dist(loc, other.loc);
      if((d>0)&&(d<desiredseparation)){
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        sum.add(diff);
        count++;
      }
     
    }
    if(count > 0){
      sum.div(count);
      sum.setMag(maxspeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
  
}