class Mover{
PVector loc;
PVector vel;
PVector acc;
float mass;

  Mover(float x_, float y_, float mass_){
  loc = new PVector(x_,y_);
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  mass=mass_;
  }
  
  
  void update(){
  vel.add(acc);
  loc.add(vel);
  vel.limit(15);
  acc.mult(0);
  }
  
  void applyForce(PVector Force){
  PVector f = Force.get();
  f= PVector.div(f,mass);
  acc.add(f);
  }
  
  void display(){
  noStroke();
  fill(0,175);
  ellipse(loc.x,loc.y,16,16);
  }

}