class Particle{
PVector loc;
PVector vel;
PVector acc;
float lifespan, r,g,b;

    Particle(){
    loc = new PVector();
    vel = new PVector();
    acc = new PVector();
     lifespan=255;  
     r=0;
     g=0;
     b=0;
   }
      
    Particle(PVector origin){
      loc = origin;
      vel = new PVector(0,0);
      acc = new PVector(random(-1,1),random(-1,1));
      lifespan = 255;
      r=random(120,255);
      g=random(60,140);
      b=0;
   
    }
    
    void run(){
    update();
    display();
    }
    
    void update(){
      vel.add(acc);
      loc.add(vel);
      acc.mult(0);
      lifespan-=2;
    }
    
    void display(){
      noStroke();
      fill(r,g,b,lifespan);
      pushMatrix();
      translate(loc.x,loc.y);
      ellipse(0,0,10,10);
      popMatrix();
    }
    
    boolean isDead(){
    if(lifespan<0.0)return true; return false;
    }
  
}