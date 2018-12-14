class Confetti extends Particle{

    Confetti(PVector l){
      super(l);
    }
    
    void display(){
      theta = map(loc.x,0,width,0,TWO_PI*2);
      fill(0,lifespan);
      stroke(0,lifespan);
      rectMode(CENTER);
      pushMatrix();
      translate(loc.x,loc.y);
      rotate(theta);
      rect(0,0,8,8);
      popMatrix();
    }
    
}