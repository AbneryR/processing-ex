class Vehicle{
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;
  
    Vehicle(float x, float y){
      loc = new PVector (x,y);
      vel = new PVector(0,0);
      acc = new PVector (0,0);
      r = 4;
      maxspeed = 8;
      maxforce = .2;
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
    
    void display(){
    float theta = vel.heading() + HALF_PI;
    noStroke();
    fill(120,40,120,100);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape(); 
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
    }
    
    void applyBehaviors(ArrayList<Vehicle> vehicles){
      PVector gather = gather(vehicles);
      PVector seek = seek(new PVector(mouseX,mouseY));
      
      applyForce(gather);
      applyForce(seek);
    
    }
    
    void applyForce(PVector force){
      //PVector f = PVector.div(force, r);
      acc.add(force);
    }
    
    PVector seek(PVector target){
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
    }
    
    
    PVector gather(ArrayList<Vehicle> vlist){
        float desiredseparation = 50;
        PVector sum = new PVector();
        int count = 0;
        
        for(Vehicle other : vlist){
          float d = PVector.dist(loc,other.loc);
          if((d>0) && (d<desiredseparation)){
            PVector diff = PVector.sub(other.loc, loc);
            diff.normalize();
            sum.add(diff);
            count++;
        } 
          
    }
    if(count > 0){
      sum.div(count);
      sum.setMag(maxspeed);
      PVector steer  = PVector.sub(sum,vel);
      steer.limit(maxforce);
      return steer;
    }
    else
      return new PVector(0,0);
   }
  
  

}