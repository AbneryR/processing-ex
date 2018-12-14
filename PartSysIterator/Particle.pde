class Particle {
PVector loc;
PVector vel;
PVector acc;
float mass;
float theta;
float lifespan;
float b,r,g;

  Particle(PVector loc_){
    loc= loc_.copy();
    vel = new PVector();
    acc = new PVector(random(-1,1),random(-1,1));
    mass = 10;
    theta = PI/4;
    lifespan = 255; 
    r=random(100,230);
    g=random(0,140);
    b=random(60,200);
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
  boolean isDead(){
  if(lifespan<0.0)return true;return false;
  }
  void display(){
    stroke(0);
    fill(0,145);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    ellipse(0,0,mass*1.3,mass*1.3);
    popMatrix();
  }
  
  void edges(){
  if(loc.x<0){loc.x=0;vel.x*=-1;}
  if(loc.x>width){loc.x=width;vel.x*=-1;}
  if(loc.y<0){loc.y=0;vel.y*=-1;}
  if(loc.y>height){loc.y=width;vel.y*=-1;}
  }
  

}