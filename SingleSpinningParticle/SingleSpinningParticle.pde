//ParticleSystem ps;
Particle p;
void setup(){
  size(800,600);
  //ps =new ParticleSystem();
  p = new Particle(new PVector(width/2,10));
}

void draw(){
  background(255);
  PVector gravity = new PVector(0,0.9);
  PVector mousef = PVector.sub(p.loc, new PVector(mouseX,mouseY));
  mousef.normalize();
  mousef.mult(-1);
  p.applyForce(mousef);
  p.applyForce(gravity);
  p.run();
  if(p.isDead())p = new Particle(new PVector(width/2,10));
  
  //ps.run();
}