class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  float r;
  float g;
  float b;
  
    Particle(PVector l){
      loc = l.get();
      vel = new PVector(0,0);
      acc = new PVector(random(-1,1),random(-1,1));
      lifespan = 255;
      r= random(200,255);
      g= random(100,200);
      b= random(10,50);
      
    }
    
    void run(){
      update();
      display();
      edges();
    }
    
    void update(){
      vel.add(acc);
      loc.add(vel);
      vel.limit(3);
      acc.mult(0);
      //lifespan-=2;
    }
    
    void display(){
      noStroke();
      fill(r,g,b);
      ellipse(loc.x,loc.y,10,10);
    }
    
    void applyForce(PVector force){
      PVector f =  force.get();
      acc.add(f);
    }
    void edges(){
      if(loc.x<0){loc.x=0;vel.x*=-1;}
      if(loc.x>width){loc.x=width; vel.x*=-1;}
      if(loc.y<0){loc.y=0;vel.y*=-1;}
      if(loc.y>height){loc.y=height; loc.y*=-1;}
    }
    
    void repel(Particle otherP){
     PVector dist = PVector.sub(this.loc, otherP.loc);
     float d = dist.mag();
     dist.normalize();
     //dist.mult(d);
     if(d<10*1.5){
      otherP.acc.add(dist.mult(d*.1));
     }
    }
    

}