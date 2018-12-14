class Vehicle{
  
  PVector acc;
  PVector vel;
  PVector loc;
  float r;
  float maxspeed;
  float maxforce;
  
 Vehicle(float x, float y) { 
   acc = PVector.random2D();
   vel = new PVector(0,0);
   loc = new PVector(x,y); 
   r = 3.0;
   maxspeed = 4;
   maxforce = 0.1;
}

 void run(){
 update();
 display();
 edges();
 }

    
    void update(){
    vel.add(acc);
    vel.limit(25);
    loc.add(vel);
    acc.mult(0);
    
    }
    
    void seek(PVector target){
      PVector desired = PVector.sub(target, loc);
      desired.normalize();
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired,vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
    
    
    void applyForce(PVector force){
      acc.add(force);
    
    }
    
  void follow(Path p) {
   PVector predict = vel.get(); // we get the velocity
   predict.normalize(); //we get the direction 
   predict.mult(25); //we calculate 25px ahead of the direction vehicle's heading
   PVector predictLoc = PVector.add(loc, predict); // we find the location predicted 
   fill(200,0,200);
   //line(loc.x,loc.y,predict.x,predict.y);
   
   PVector a = p.start;
   PVector b = p.end;
   PVector normalPoint = getNormalPoint(predictLoc,a,b);
   PVector dir =  PVector.sub(b,a);
   dir.normalize();
   dir.mult(10);
   PVector target = PVector.add(normalPoint,dir);
   float distance = PVector.dist(normalPoint,predictLoc);
   //float theta = PVector.angleBetween(a,b);
   //float theta = acos(a.dot(b) / (a.mag() * b.mag())); // using dot product we get the angle
   //float d = a.mag() * cos(theta);
   //b.normalize();
   //}b.mult(d); //we scale b's length
   if(distance > p.radius){ // if the distance between the vehicle and the path is greater than the broadness of the path
        
          seek(normalPoint);  
    }
   
    if(loc.x < 0 ){ loc.x= width; }
    if(loc.x >width){loc.x = 0;}

   fill(255,0,0);
   line(loc.x,loc.y, predictLoc.x,predictLoc.y);
   line(predictLoc.x,predictLoc.y, normalPoint.x , normalPoint.y);
  
   
   //return predict;
  }
  
  PVector getNormalPoint(PVector p, PVector a, PVector b){
    PVector ap = PVector.sub(p,a); //predicted location
    PVector ab = PVector.sub(b,a);
    fill(0,0,255);
   // line(ap.x, ap.y, ab.x, ab.y);
    
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    
    return normalPoint;
  }
  
  void display() {
    // Draw a triangle rotated in the direction of velocity
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
  
  
  void edges(){
 
  }
    
  //Distance between predicted point and line
  // length of the normal (vector perpedicular to the line) between point and line
    

}