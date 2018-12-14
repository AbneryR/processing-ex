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
    fill(175,20,145, 140);
    noStroke();
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
  
  void seek(PVector target){
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
   
  void cohesion(ArrayList<Vehicle> vlist){
    
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    
    for(Vehicle other : vlist){
      float d = PVector.dist(loc, other.loc);
      if((d>0)&&(d<desiredseparation)){
        PVector diff = PVector.sub(other.loc, loc);
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
  
  void follow(Path p){
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(loc,predict);
    PVector normal = null;
    PVector target = null;
    float worldRecord = 1000000;
    for(int i = 0 ; i<p.points.size()-1; i++){
      PVector a = p.points.get(i);
      PVector b = p.points.get(i+1);
      PVector normalPoint = getNormalPoint(predictLoc,a,b);
      if(normalPoint.x < min(a.x,b.x) || normalPoint.x > max(b.x,a.x)){
        normalPoint = b.get();
      }
      
      float distance = PVector.dist(predictLoc, normalPoint);
      
      if(distance < worldRecord){
        worldRecord = distance;
        normal = normalPoint.get();
        
        PVector dir = PVector.sub(b,a);
        dir.normalize();
        dir.mult(10);
        target = PVector.add(normalPoint,dir);
      } 
    }
      if(worldRecord> p.radius){
        seek(target);
      }
  }
  
  PVector getNormalPoint(PVector p, PVector a ,PVector b){
    PVector ap = PVector.sub(p,a);
    PVector ab = PVector.sub(b,a);
    
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a,ab);
    
    return normalPoint;
  }
  
   void checkedges(){
    
    if (loc.x > width) loc.x = 0;
    else if (loc.x < 0) loc.x = width;
    if (loc.y > height) loc.y = 0;
    else if (loc.y <  0) loc.y = height;
  }
  
}