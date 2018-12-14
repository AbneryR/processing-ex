class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
 // float angle;

    Particle(PVector l){
      loc = l.get();
      vel = new PVector(0,0);
      acc = new PVector(random(-1,1),random(-1,1));
      lifespan = 255;
    //  angle = PI/4;
    }
    
    void run(){
      update();
      display();
      
    }
    
    void update(){
      vel.add(acc);
      loc.add(vel);
      vel.limit(3);
      acc.mult(0);
      lifespan-=2;
    //  angle = atan2(vel.x,vel.y);
    }
    
    void display(){
      noStroke();
      //pushMatrix();
      imageMode(CENTER);
      //translate(loc.x,loc.y);
      //rotate(angle);
      tint(255,lifespan);
      image(img,loc.x,loc.y);
      //popMatrix();  
  }
    
    void applyForce(PVector force){
      PVector f =  force.get();
      acc.add(f);
    }
    
    boolean isDead(){
    if(lifespan<0.0)return true;return false;
    }
    
}