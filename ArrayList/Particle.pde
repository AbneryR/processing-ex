class Particle{
PVector loc;
PVector vel;
PVector acc;
float mass;
float theta;
float lifespan;

  Particle(PVector loc_){
    loc= loc_.copy();
    vel = new PVector();
    acc = new PVector();
    mass = 10;
    theta = PI/4;
    lifespan = 255;
  }

  void run(){
  update();
  display();
  edges();
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    lifespan -= 2.0;
    theta = atan2(vel.x,vel.y);
  }
  
  void applyForce(PVector force){
    PVector f=PVector.div(force,mass);
    acc.add(f);
  }
  
  void display(){
    stroke(0);
    fill(0,175);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    rect(0,0,mass,mass);
    popMatrix();
  }
  
  void edges(){
  if(loc.x<0){loc.x=0;vel.x*=-1;}
  if(loc.x>width){loc.x=width;vel.x*=-1;}
  if(loc.y<0){loc.y=0;vel.y*=-1;}
  if(loc.y>height){loc.y=width;vel.y*=-1;}
  }
  

}