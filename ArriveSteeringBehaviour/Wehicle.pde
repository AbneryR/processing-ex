class Wehicle{
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;
  float noice;
  
  Wehicle(PVector loc_, float r_){
    loc = loc_;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    r = r_;
    maxspeed= 4;
    maxforce= 0.1;
    noice= random(1);
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
    //PVector f = PVector.div(force,r);
    acc.add(force);
  }
  
  void wander(){
    PVector future = PVector.add(PVector.mult(vel,10),loc);
    float tarX = future.x + sin(map(noise(noice),0,1,0,TWO_PI))*40;
    float tarY = future.y + cos(map(noise(noice),0,1,0,TWO_PI))*40;
    PVector target = new PVector(tarX,tarY);
    PVector steer= PVector.sub(target, vel);
    steer.limit(maxforce);
    applyForce(steer);
    noice+=.01;
    strokeWeight(1);
    noFill();
    stroke(0);
    ellipseMode(CENTER);
    ellipse(future.x,future.y,40,40);
    strokeWeight(4);
    point(tarX,tarY);
  }
  
  void display(){
     float theta = vel.heading() + PI/2;
     fill(175);
     strokeWeight(1);
     stroke(0);
     pushMatrix();
     translate(loc.x,loc.y);
     rotate(theta);
     beginShape();
     vertex(0,-r*2);
     vertex(-r, r*2);
     vertex(r,r*2);
     endShape();
     popMatrix();
  }
  
  
 

}