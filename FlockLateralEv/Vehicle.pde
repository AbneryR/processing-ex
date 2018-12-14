class Boid{
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;
  
    Boid(float x, float y){
      loc = new PVector (x,y);
      vel = new PVector(0,0);
      acc = new PVector (0,0);
      r = 4;
      maxspeed = 4;
      maxforce = .2;
    }
    
    void run(ArrayList<Boid> boids){
      update();
      flock(boids,0);
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
    
    void flock(ArrayList<Boid> boids, float noise){
      float sightDistance = 100;
      float periphery = PI/4;
        
      PVector separate = separate(boids);
      PVector align = align(boids);
      PVector gather = gather(boids);
      PVector seek = seek(new PVector(mouseX,mouseY));
     
      
      for(Boid other : boids){
        PVector comparison = PVector.sub(other.loc,loc);
        float d = PVector.dist(loc, other.loc);
        float diff = PVector.angleBetween(comparison, vel);
        float odir = other.vel.heading();
        float dir = vel.heading() - odir;
        dir *= 1.2;
        PVector lat = new PVector(cos(dir),sin(dir));
        
        if(diff < periphery && d > 0 && d < sightDistance){
                applyForce(align);
                separate.mult(1+noise);
                applyForce(separate);
                
                applyForce(lat);
                
        }
      }///end view 
      
        seek.mult(1+noise);
        applyForce(seek);
      
       float currentHeading = vel.heading();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(currentHeading);
    fill(0, 100);
    arc(0, 0, sightDistance*2, sightDistance*2, -periphery, periphery);
    popMatrix();
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
    

    PVector separate(ArrayList<Boid> blist){
        float desiredseparation = 50;
        PVector sum = new PVector();
        int count = 0;
        
        for(Boid other : blist){
          float d = PVector.dist(loc,other.loc);
          if((d>0) && (d<desiredseparation)){
            PVector diff = PVector.sub(loc, other.loc);
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
   
   PVector gather(ArrayList<Boid> blist){
        float desiredseparation = 50;
        PVector sum = new PVector();
        int count = 0;
        
        for(Boid other : blist){
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
  
  
    PVector align(ArrayList<Boid> boids){
      float neighborDistance = 20;
      int count = 0;
      PVector sum = new PVector(0,0);
      for(Boid other : boids){
        float actualDistance = PVector.dist(other.loc,loc);
        if( actualDistance>0 && actualDistance<neighborDistance){
        sum.add(other.vel);
        count++;
        }
        
      }
      if(count>0){
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,vel);
      steer.limit(maxforce);
      return steer;
      }
      else 
        return new PVector(0,0);
      
    }

}