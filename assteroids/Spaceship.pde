class Spaceship {
  PVector loc;
  PVector vel;
  PVector acc;
  float angle;
  float r;
  float mass;

  Spaceship(float x_, float y_) {
    loc = new PVector(x_, y_);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    angle = 90;
    r = 10;
    mass= 10;
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    beginShape();
    vertex(-r,r);
    vertex(0,-r);
    vertex(r,r);
    endShape(CLOSE);
    popMatrix();
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acc.add(force);
  }
  
  void drag(){
  float c = 0.01;
  float vmag= vel.mag();
  float drmag = c*vmag*vmag; 
  PVector dr = vel.get();
  dr.mult(-1);
  dr.mult(drmag);
  applyForce(dr);
  }
  
  void wrapedges(){
   if(loc.x <0-20 ) loc.x=width+10;
   if(loc.x >width+20 ) loc.x=0-10;
   if(loc.y <0-20 ) loc.y=height+10;
   if(loc.y >height+20 ) loc.y=0-10;
  
  }
  
  void thrust(){
    float dir= angle - PI/2;
    PVector thr = new PVector(cos(dir), sin(dir));
    thr.mult(.2);
    applyForce(thr);
  }

}