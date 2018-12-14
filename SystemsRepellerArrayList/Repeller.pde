class Repeller{
  PVector loc;
  float r=10;
  float strength = 100;
  
  Repeller(PVector l){
    loc = l.get();
    
  }
  
  void display(){
    stroke(0);
    fill(150);
    ellipse(loc.x, loc.y, r*2,r*2);
  }
  
  PVector repel(Particle p){
    PVector backyaway = PVector.sub(this.loc, p.loc);
    float d = backyaway.mag();
    backyaway.normalize();
    d = constrain(d,5,100);
    float force = -1 * strength / (d*d);
    backyaway.mult(force);
    return backyaway;
  }

}